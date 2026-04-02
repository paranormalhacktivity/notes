## Droplet configuration and creation
Create project in Digital Ocean admin
Create droplet
Select NYC as preferred data center
Select Ubuntu as OS
Select Premium AMD as the CPU, with Basic as the selected CPU option ~$7/month 1 vCPU, 2 GB RAM, 50 GB SSD
Enable free monitoring option
Enable free IPv6 networking
Name the droplet hostname
Add to project

## Setup linux environment
SSH into the droplet(or use the console button in Digital Ocean)
change root password
```
sudo passwd root
```

create a non-root user
```
adduser --disabled-password --gecos "" deploy
usermod -aG sudo deploy
```
`adduser`: high-level wrapper around `useradd` for more convenient use
`--disabled-password`: creates the user without a usable UNIX password, so it cannot log in via password.(We'll allow only SSH-key logins)
`--gecos ""`: skips the usual full-name/room-number/etc prompts and just leaves those fields blank
`deploy`: the username we're creating

Lock down SSH
Disable password-based SSH logins
```
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
```
The above command, `sed -i` will find and edit the `PasswordAuthentication yes` line in the `/etc/ssh/sshd_config`, and update it to `PasswordAuthentication no`
Which prevents any user (including root or deploy) from logging in with a password. only SSH keys work.

Change password for deploy user, this was weird, I thought creating a user with --disabled-password, things would
work without, but running `sudo` seems to require it, so def update the password, now, at this step.
```
passwd deploy
```

Disable root SSH login
```
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
```
The above command basically performs the same update to the `/etc/ssh/sshd_config`, but now prevents root login altogether,
combined with key-only logins, makes it almost impossible for an attacker to gain root access.

Reload the SSH daemon
```
systemctl reload sshd
```

Switch to new deploy user, by logging out of console, and either clicking the "Access" tab of Digital Ocean,
and in "Droplet Console" "Log in as..." option, specifying the `deploy` user, and Launching Droplet Console, or
by adding your computer's public ssh key, to the droplet's `/home/deploy/.ssh/authorized_keys` and sshing as the deploy user, into the
droplet, from your computer.

Once inside the droplet, as the deploy user, harden the firewall for both IPv4 and IPv6
Enable UFW with both families:
```
sudo apt update
sudo apt install ufw
sudo sed -i 's/IPV6=no/IPV6=yes/' /etc/default/ufw

# Default policy: deny in, allow out
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH, HTTP, HTTPS on both v4 and v6
sudo ufw allow OpenSSH
sudo ufw allow 80,443/tcp

sudo ufw enable
```

Auto-apply security updates with `unattended-upgrades`
```
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
```
Click "yes" when prompted about making automatic system updates

Install `fail2ban`
```
sudo apt install fail2ban
sudo systemctl enable --now fail2ban
```

Install Docker and Docker Compose
Set up docker apt repository:
```
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
```

Then install latest docker version:
```
 sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 sudo docker run hello-world # verify correctly installed by running test image
```

Then install latest docker compose version
```
sudo apt update
sudo apt install docker-compose-plugin
docker compose version # verify correctly installed by checking version
```

Ensure that `deploy` user is able to run Docker
```
sudo usermod -aG docker deploy
```

Create ssh key in the droplet, and add the public key to your Github/Gitlab list of approved ssh keys
```
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
```

Pull your code
```
cd ~
git clone git@github.com:user/project-repo.git
```

Modify `docker-compose.yml` to include the `caddy` service, as a simple NGINX alternative,
that will automatically manage tls certificates. You can also setup your docker-compose.yml
with `profiles` so that you can include/exclude services in different environments i.e.
you don't really need caddy in development, but need it in upper environments.

docker-compose.yml example:
```
version: "3.9"

# persistent volumes
volumes:
  bundle:
  caddy_data:
  caddy_config:

services:
  # ────────────────────────────────────────────────────────────
  # your Rails app, always included
  web:
    build:
      context: .
      args:
        # fall back to 'development' if RAILS_ENV isn't set in .env
        RAILS_ENV: ${RAILS_ENV:-development}
    image: myapp:${RAILS_ENV:-development}
    env_file:
      - .env
    environment:
      # make sure Rails serves static assets in prod
      RAILS_SERVE_STATIC_FILES: ${RAILS_SERVE_STATIC_FILES:-false}
    tty: true
    command: >
      bash -lc "
        # remove stale PID, then precompile assets only in production
        rm -f tmp/pids/server.pid &&
        if [ \"$RAILS_ENV\" = production ]; then
          bundle exec rails assets:precompile;
        fi &&
        bundle exec puma -C config/puma.rb
      "
    volumes:
      - bundle:/usr/local/bundle
      - .:/my_app:cached
    # in dev you'll map to a host port; in prod Caddy will proxy to :3000
    ports:
      - "${WEB_PORT:-3000}:3000"

  # ────────────────────────────────────────────────────────────
  # dev‐only mailcatcher
  mailcatcher:
    image: schickling/mailcatcher
    ports:
      - "1080:1080"
    profiles:
      - dev

  # ────────────────────────────────────────────────────────────
  # prod‐only Caddy reverse proxy + automatic HTTPS
  caddy:
    image: caddy:2
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data
      - caddy_config:/config
    profiles:
      - prod
```

Then add the `Caddyfile` to configure `caddy` for your web application.
```
# Caddyfile

# Replace with whatever subdomain you chose
app.yourdomain.com {
  # Automatically obtain & renew HTTPS certs from Let’s Encrypt
  tls you@example.com

  # Serve any static assets directly (optional)
  @assets {
    path /packs/* /assets/* /favicon.ico /robots.txt
  }
  handle @assets {
    root * /my_app/public
    file_server
  }

  # Everything else gets reverse-proxied to your Rails container
  reverse_proxy web:3000 {
    # (optional) adjust timeouts
    transport http {
      read_timeout  1m
      write_timeout 1m
    }
  }

  # (optional) very basic request logging
  log {
    output stdout
    format single_field common_log
  }
}
```

Setup DNS records. In my case, I already had the DNS for the main domain setup, but
I needed a subdomain, pointing to my server, as the main domain was being used for a
public facing CMS site, created through squarespaace.
```
Type	Host/Subdomain	Value (IP Address)	TTL
A	app	123.45.67.89 (your droplet)	3600
AAAA	app	2001:0db8:1234:...	3600
```

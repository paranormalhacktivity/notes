These notes are for the post-installation setup for Arch-based systems. This is
where the personalization of the system happens. Make your system feel like home!

"Today you are you, that is truer than true. There is no one alive who is youer
than you" - Dr. Seuss

1. Install a terminal emulator. This is for Kitty Terminal. 
```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin 
sudo ln -sfn ~/.local/kitty.app/bin/kitty /usr/bin/kitty
```

2. Install i3wm
```bash
sudo pacman -S i3 xorg xorg-xdm dmenu i3status ttf-dejavu
echo "exec i3" > ~/.xinitrc
sudo chmod +x ~/.xinitrc
```

3. Boot into i3 from virtual console. Once loaded, will prompt to generate config.
	Yes if aren't getting one from somewhere else.
```bash
startx
```

4. Need a browser. Let's install qutebrowser.
```bash
sudo pacman -S python qutebrowser
```

5. Caps lock is annoying. Let's remap it as a new CTRL button...
```bash
vim /etc/X11/xorg.conf.org/90-custom-keyboard.conf
```
...and add the following
```
Section "InputClass"
	Identifier "keyboard defaults"
	MatchIsKeyboard "on"

	Option "XKbOptions" "ctrl:nocaps"
EndSection
```

6. I like "natural scrolling". Do you like "natural scrolling"? If you do...
```bash
vim /etc/X11/xorg.conf.org/30-touchpad.conf
```
...and add the following
```
Section "InputClass"
	Identifier "touchpad"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "TappingDrag" "on"
	Option "ClickMethod" "clickfinger"
	Option "NaturalScrolling" "true"
	Option "HorizontalScrolling" "true"
EndSection
```

7. Install Plug, to manage vim plugins.
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

8. We're gonna need ssh to get things from Github.
```bash
sudo pacman -S openssh
ssh-keygen -t ed25519
```

9. I have dotfiles on Github. Clone the repo so that things are configured properly.
```bash
cd ~
echo ".dotfiles.git" >> .gitignore
git clone git@github.com:hkn34/.dotfiles.git $HOME/.dotfiles.git --bare
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
rm .bashrc .gitignore
config config --local status.showUntrackedFiles no
config checkout
```

10. Open up vimrc...
```bash
vim ~/.vimrc
```
...and install vim plugins by running the following from command mode `:PlugInstall`

11. More applications to install
	- neofetch so that we can flex on all non-Arch users.
	- docker so that we can develop in a controlled environment.
	- rofi as an alternative to the dmenu application launcher.
	- which, because it's handy to know where binary files are located.
	- gnupg because we need gpg to setup pass.
	- pass as a super clutch manager that can be integrated with qutebrowser.
	- python-tldextract so that pass integrates with qutebrowser.
	- docker-compose because we want to orchestrate our docker containers.
```bash
sudo pacman -S neofetch docker rofi which gnupg pass python-tldextract
sudo groupadd docker
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

12. To setup pass we need to generate a gpg key, but the Kitty Terminal doesn't
	like that so we need to go back to virtual console.
```bash
i3 exit
sudo chown <user>:tty $(tty)
gpg --full-generate-key # don't add passphrase if planning on integrating pass with qutebrowser's auto fill
pass init <GPGID>
pass insert <website.com>/<username>
startx
```

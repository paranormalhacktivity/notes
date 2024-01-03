These notes are specific to the installation of Artix Linux. Since Artix is an
Arch-based distro, the exception being, that it does not have the infamous systemd,
the installation process is extremely similar.

1. Download Artix iso image and copy it to usb from https://artixlinux.org

2. Format usb as bootable usb

3. Remove existing partitions on receiving computer(optional)

4. Plug in usb to receiving computer

5. Boot computer with usb, by going into the BIOS menu(F1, F2, or esc repeatedly upon restart of computer)

6. Once computer has booted, select "Boot from stick/HDD" from the Artix menu options

7. Navigate to a console

8. Switch to root user, `su`

9. Create partitions using `cfdisk <DISKNAME>`(skip if you already have existing partitions to use)
```bash
/dev/sda1  15G Linux Filesystem # For Root, 15G is plenty
/dev/sda2   1G Linux Filesystem # For Boot, 1G is all that is needed
/dev/sda3  16G Linux Filesystem # For Swap, rule of thumb is 1.5-2x the amount of RAM for the system
/dev/sda4 899G Linux Filesystem # For Home, this can be the remainder of the free space on the system
```

10. Format the partitions by doing the following from terminal
```bash
mkfs.ext4 -L ROOT /dev/sda1
mkfs.fat -F32 /dev/sda2
fatlabel /dev/sda2 BOOT
mkfs.ext4 -L HOME /dev/sda4
mkswap -L SWAP /dev/sda3
```

11. Mount partitions by doing the following
```bash
swapon /dev/disk/by-label/SWAP
mount /dev/disk/by-label/ROOT /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount /dev/disk/by-label/HOME /mnt/home
mount /dev/disk/by-label/BOOT /mnt/boot
```

12. Connect to internet by running `connmanctl` from terminal, then doing the following in the interactive prompt
```bash
enable wifi
scan wifi
services # to get the name of wifi service
connect <WIFI_SERVICE_NAME>
exit
```

13. Run `ping artixlinux.org` to test connection

14. Install Artix
```bash
basestrap /mnt base base-devel s6-base elogind-s6  # Install basic firmwares(pt. 1)
basestrap /mnt linux linux-firmware					   # Install basic firmwares(pt. 2)
fstabgen -U /mnt >> /mnt/etc/fstab				   # Not entirely sure what this does but I know it's important
artix-chroot /mnt
```

15. Install Text Editior
```bash
pacman -S vim
```

16. Time/Clock/Locales
```bash
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
vim /etc/locale.gen # Uncomment en_US
locale-gen
vim /etc/locale.conf
```
...once inside locale.conf, add the following
```
export LANG="en_US.UTF-8"
export LC_COLLATE="C"
```

17. Install Bootloader
```bash
pacman -S grub os-prober efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```

18. Add Users
```bash
passwd # Set root password
useradd -m username
passwd username
```

19. Setup hostname with `vim /etc/hostname` and put the following inside
```bash
hackpad
```

20. Setup hosts with `vim /etc/hosts` and put the following inside
```bash
127.0.0.0 localhost
::1       localhost
127.0.1.1 hackpad.localdomain hackpad
```

21. Install DHCP client
```bash
pacman -S dhcpcd dhclient
```

22. Install Connman for internet connectivity
```bash
pacman -S connman-s6
```

23. Reboot the system
```bash
exit
umount -R /mnt
reboot
```

Now usb is able to be unplugged and system should boot to an actual root login. Type in root as username and give root's password when prompted
Congrats! Pat yourself on the back, you now have a successful Arch Install!
...But we're not done quite yet. We need to modify this system so that it feels good

24. Add our user and make them an admin. To do this open up the /etc/sudoers file
```bash
EDITOR=vim visudo # This command will open the /etc/sudoers file. In this file, uncomment the line that says "wheel". This is the admin user group
```

25. Connect to wifi with `connmanctl`
```bash
enable wifi
scan wifi
agent on
services # to get the name of wifi service
connect <WIFI_SERVICE_NAME>
```

26. Add user to the following groups
```bash
usermod -a -G wheel,audio,video hack
```

27. Switch to non-root user `su hack`

28. Install some programs, like a browser
```bash
sudo pacman -S git python qutebrowser
```

29. Install a terminal emulator. This is for kitty.
```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -sfn ~/.local/kitty.app/bin/kitty /usr/bin/kitty
```

30. Install i3wm
```bash
sudo pacman -S i3 xorg xorg-xdm xorg-xinit dmenu i3status ttf-dejavu
echo "exec i3" > ~/.xinitrc
sudo chmod +x ~/.xinitrc
```

31. Boot into i3 from virtual console
```bash
startx
```


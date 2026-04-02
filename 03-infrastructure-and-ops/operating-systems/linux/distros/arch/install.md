These notes are specific to the installation of Arch Linux. This is to make what
is perceived as a complex process, slightly less complex.

1. Download iso from https://www.archlinux.org/download/

2. format usb as bootable usb and plug into receiving computer

3. to boot computer with the usb, open BIOS menu, usually by pressing F1 or F2 or sometimes ESC repeatedly at start

4. Once computer has booted to usb, you'll be in Virtual Console

5. Connect to wifi using iwd

```bash
iwctl --passphrase <wifi passwd> station <device> connect <SSID>
```

6. set system time by using ntp(Network Time Protocol)

7. Partition disk using cgdisk, disk should have at the very least 2 partitions, one for boot which should be EFI 
and one for the main filesystem that should be ext4. Swap used to be necessary but is no longer necessary.

```bash
cgdisk <Disk name> # usually in the format of /dev/sda, if not known, can usually get by running fdisk --list
# boot = efi - should be a partition
# / = default(linux filesystem) should be another partition
mkfs.vfat -F32 <Disk partition name> # usually in format of /dev/sda1
mkfs.ext4 <Disk partion name>        # use second partition here ex. /dev/sda2
```

8. mount the filesystems
```bash
mount /dev/sda2 /mnt      # mount the root partition to /mnt
mkdir /mnt/boot			  # make a separate directory for boot partition to be mounted to
mount /dev/sda1 /mnt/boot # mount the boot partition to /mnt/boot
```

9. Install arch
```bash
pacstrap /mnt base linux linux-firmware # installs basic firmwares
genfstab -U /mnt >> /mnt/etc/fstab      # not entirely sure what this does but know it's necessary
```

10. Change to root partition
```bash
arch-chroot /mnt
```

11. Time/Clock/locales
```bash
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systahc
vim /etc/locale.gen  # uncomment en_US
vim /etc/locale.conf # LANG=en_US
locale-gen
```

12. Setup hosts and hostname
```bash
echo "myhostname" >> /etc/hostname                # hostname can be whatever you want it to be
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 myhostname.localdomain myhostname
```

13. Set root/boot
```bash
mkinitcpio -P # this creates the initial ramdisk, basically a small environment that loads various kernel modules and necessities before handing them off to the init system(systemd)
passwd        # create root's(sysadmin) password
```

14. Setup bootloader
```bash
bootctl --path=/boot install
rm /boot/loader/loader.conf
echo "default arch" >> /boot/loader/loader.conf
echo "timeout 4" >> /boot/loader/loader.conf
echo "editor 0" >> /boot/loader/loader.conf
blkid /dev/sda2 > blk.txt    # Not sure what this does. Does however contain the PARTUUID
touch /boot/loader/entries/arch.conf
echo "title Arch Linux" >> /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=PARTUUID=<PARTUUID> rw" >> /boot/loader/entries/arch.conf
```

15. Install some things
```bash
pacman -S vim wpa_supplicant git sudo
```
16. Exit and reboot
```bash
exit
reboot
```

17. Now usb is able to be unplugged and system should boot to an actual root login. Type in root as username and give root's password when prompted.

18. Congrats! Pat yourself on the back, you now how a successful Arch Install!

...But we're not done quite yet. We need to modify this system so that it feels good

19. First, let's add our user and make them an admin. To do this open up the /etc/sudoers file
```bash
EDITOR=vim visudo # This command will open the /etc/sudoers file. In this file, uncomment the line that says "wheel". This is the admin user group
```

20. Now that we've given the "wheel" group admin priveleges, lets add our user
```bash
useradd -G wheel,audio,video -m <username> -p <password>
```

21. Switch to the newly created user
```bash
su <username>
```

22. add things for audio
```bash
sudo pacman -S pulseaudio alsa-utils alsa-firmware
```

23. Now let's perform a system update
```bash
sudo pacman -Syu
```

24. setup bluetooth...
```bash
sudo pacman -S bluez bluez-utils
systemctl start bluetooth
bluetoothctl
```
...in bluetoothctl interactive, do the following
```
power on
devices
scan on # if device is not in devices, it wont be if first time
agent on
pair <MAC address of device>
connect <MAC address of device>
```
...if the above doesn't work, open `/etc/bluetooth/main.conf` and uncomment and edit the following as...
```
ControllerMode=bredr
```

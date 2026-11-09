# Arch Linux Encrypted LVM Installation (LVM on LUKS) Guide

- Create a live USB with Arch Linux
- Boot into live USB
- Connect to the internet:

  ```bash
  iwctl
  station wlan0 connect "SSID"
  quit
  ```

- Partition the disks
  - Identify the target drive with `fdisk -l` (e.g. `/dev/sdX`, `/dev/nvme0nX`)
  - Partition the target drive with `fdisk /dev/nvme0n1`
    - Create a new GPT disklabel
    - Create the partitions as follows:
        1. 1-4 GiB for EFI system partition ("boot partition")
        2. Remaining space for encrypted block device

- Setup the drive:

  ```bash
  cryptsetup luksFormat /dev/nvme0n1p2      # Create encrypted container for LVM install
  cryptsetup open /dev/nvme0n1p2 cryptlvm   # Open the container as "cryptlvm"
  pvcreate /dev/mapper/cryptlvm             # Create physical volume on encrypted container
  vgcreate vg1 /dev/mapper/cryptlvm         # Create volume group "MyVolGroup" on physical volume

  ```

  > [!NOTE]
  > The size of the logical volumes is by choice. However, if you wish to use hibernation, you'll need a swap volume at least the size of your main memory contents.

  ```bash
  lvcreate -L 64G -n swap vg1               # Create swap volume
  lvcreate -L 300G -n root vg1              # Create root volume
  lvcreate -l 100%FREE -n home vg1          # Create home volume
  ```

- Filesystem setup:

  ```bash
  mkfs.ext4 /dev/vg1/root
  mkfs.ext4 /dev/vg1/home
  mkfs.fat -F32 /dev/nvme0n1p1
  mkswap /dev/vg1/swap

  mount /dev/vg1/root /mnt
  mount --mkdir /dev/vg1/home /mnt/home
  mount --mkdir /dev/nvme0n1p1 /mnt/boot
  swapon /dev/vg1/swap
  ```

- Base install:

  ```bash
  pacstrap -K /mnt base base-devel linux linux-firmware amd-ucode vim networkmanager plymouth lvm2 grub efibootmgr git
  ```

- System configuration:

  ```bash
  genfstab -U /mnt >> /mnt/etc/fstab                    # Generate fstab

  arch-chroot -S /mnt                                   # Shell into new install on target drive

  ln -sf /usr/share/zoneinfo/US/Central /etc/localtime  # Time symlink
  hwclock --systohc                                     # Update hardware clock

  locale-gen                                            # Generate locale information
  vim /etc/locale.conf
  ```
  ```
  LANG-en_US.UTF-8

   ```
  ```bash
  echo "mycoolhostname" > /etc/hostname

  systemctl enable NetworkManager

  vim /etc/mkinitcpio.conf
  ```
  ```
  HOOKS=(base udev autodetect microcode modconf kms keyboard block plymouth encrypt lvm2 filesystems resume fsck)

  ```
  ```bash
  mkinitcpio -P
  ```

  - Bootloader setup

    ```bash
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

    vim /etc/default/grub
    ```
    ```
    GRUB_KERNEL_DEFAULT="cryptdevice=/dev/nvme0n1p2:cryptlvm root=/dev/vg1/root rootwait"

     ```
     ```bash
    grub-mkconfig -o /boot/grub/grub.cfg

  - Root user

    ```bash
    passwd
    ```

## Post-install

- Connect to the internet:
  ```bash
  nmcli device wifi connect "SSID" password "password"
  ```

- Create a new user:
  ```bash
  useradd -m username
  passwd username
  visudo                # Add another entry just like root but for "username"
  ```

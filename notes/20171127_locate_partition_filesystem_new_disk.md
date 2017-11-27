## 2017-11-27: Locate, partition and create filesystem on new disk

History of the attachment of a new disk to a CentOS 7.4 VM.

```bash
# Desc: Compare the list of available devices and mounted devices to locate the new device
[root@localhost ~]# echo "Available devices:" && ls /dev/sd? | sort && echo "Available partitions:" && ls /dev/sd?? | sort
Available devices:
/dev/sda
/dev/sdb
/dev/sdc
Available partitions:
/dev/sda1
/dev/sda2
/dev/sdb1
# Desc: /dev/sdc is the new device, because it has no available partition yet

# Desc: Check available partitions
[root@localhost ~]# fdisk /dev/sdc
Command (m for help): p

Disk /dev/sdc: 8589 MB, 8589934592 bytes, 16777216 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x7b407523

   Device Boot      Start         End      Blocks   Id  System

# Desc: Create new partition
Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p):
Using default response p
Partition number (1-4, default 1):
First sector (2048-16777215, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-16777215, default 16777215):
Using default value 16777215
Partition 1 of type Linux and of size 8 GiB is set

# Desc: Write the partition to the disk
Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.

# Desc: Re-check available partitions
Command (m for help): p

Disk /dev/sdc: 8589 MB, 8589934592 bytes, 16777216 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x7b407523

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1            2048    16777215     8387584   83  Linux

# Desc: Create a filesystem on the new created partition
[root@localhost ~]# mkfs -t ext4 /dev/sdc1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
524288 inodes, 2096896 blocks
104844 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=2147483648
64 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

# Desc: Mount the new filesystem
[root@localhost ~]# mount /dev/sdc1 /mnt/

# Desc: Add the new created partition to /etc/fstab file if it should be mounted during the boot process
```

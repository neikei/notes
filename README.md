# Summary 

- [Hint](#Hint)
- [Notes](#Notes)
  - [Linux](#Linux)
    - [2017-12-13: Simple disk usage monitoring](#2017-12-13-Simple-disk-usage-monitoring)
    - [2017-12-06: Screenfetch](#2017-12-06-Screenfetch)
    - [2017-11-27: Locate, partition and create filesystem on new disk](#2017-11-27-Locate,-partition-and-create-filesystem-on-new-disk)
    - [2017-11-22: System CLI monitoring](#2017-11-22-System-CLI-monitoring)
    - [2017-11-21: System versions](#2017-11-21-System-versions)
    - [2017-11-11: Search and replace strings in files](#2017-11-11-Search-and-replace-strings-in-files)
    - [2017-10-28: Pin ansible apt package](#2017-10-28-Pin-ansible-apt-package)
    - [2017-10-28: Install specific apt package version](#2017-10-28-Install-specific-apt-package-version)
    - [2017-10-20: SystemD multi spawn processes](#2017-10-20-SystemD-multi-spawn-processes)
    - [2017-10-15: Ubuntu optimize jpeg images](#2017-10-15-Ubuntu-optimize-jpeg-images)
    - [2017-10-04: Debian ntpdate time synchronization](#2017-10-04-Debian-ntpdate-time-synchronization)
    - [2017-09-21: Bash condition to check if file is directory](#2017-09-21-Bash-condition-to-check-if-file-is-directory)
    - [2017-08-21: Database replication status](#2017-08-21-Database-replication-status)
    - [2017-08-14: Validate archives](#2017-08-14-Validate-archives)
    - [2017-08-12: Install Oracle Java 8 on Debian Stretch](#2017-08-12-Install-Oracle-Java-8-on-Debian-Stretch)
    - [2017-07-16: Command line convenience](#2017-07-16-Command-line-convenience)
      - [~/.bashrc](#bashrc)
      - [~/.inputrc](#inputrc)
      - [~/.vimrc](#vimrc)
    - [2017-07-15: Fix locale warnings on Linux servers](#2017-07-15-Fix-locale-warnings-on-Linux-servers)
    - [2017-07-15: summarizeMD](#2017-07-15-summarizeMD)
  - [Windows](#Windows)
    - [2018-01-03: ASUS Zenbook UX310UA FanControl](#2018-01-03-ASUS-Zenbook-UX310UA-FanControl)
    - [2017-12-26: Linux system administrator tools](#2017-12-26-Linux-system-administrator-tools)
    - [2017-12-15: Ubuntu Bash installation on Windows 10](#2017-12-15-Ubuntu-Bash-installation-on-Windows-10)
  - [Continuous Integration & Continuous Delivery](#Continuous-Integration-&-Continuous-Delivery)
    - [2017-12-21: Bamboo JUnit Parser fake results for hotfixes](#2017-12-21-Bamboo-JUnit-Parser-fake-results-for-hotfixes)
    - [2017-11-23: Common HTTP status codes](#2017-11-23-Common-HTTP-status-codes)
    - [2017-10-26: Bamboo branch based configs](#2017-10-26-Bamboo-branch-based-configs)
    - [2017-09-26: Jenkins centralized syntaxchecks](#2017-09-26-Jenkins-centralized-syntaxchecks)
    - [2017-09-19: Bamboo centralized syntaxchecks](#2017-09-19-Bamboo-centralized-syntaxchecks)
    - [2017-09-18: Deploy archives with Bamboo and PHP Deployer](#2017-09-18-Deploy-archives-with-Bamboo-and-PHP-Deployer)
    - [2017-09-15: Use PHP Deployer with Bamboo](#2017-09-15-Use-PHP-Deployer-with-Bamboo)
    - [2017-09-14: Bamboo htaccess authentication errors](#2017-09-14-Bamboo-htaccess-authentication-errors)
    - [2017-08-07: HipChat notifications](#2017-08-07-HipChat-notifications)
    - [2017-08-01: Bamboo workaround for empty directories in artifacts](#2017-08-01-Bamboo-workaround-for-empty-directories-in-artifacts)
    - [2017-07-20: Syntaxchecks](#2017-07-20-Syntaxchecks)
      - [PHP](#PHP)
      - [YAML](#YAML)
  - [Ansible](#Ansible)
    - [2018-01-02: Load variables based on distribution information](#2018-01-02-Load-variables-based-on-distribution-information)
    - [2017-09-06: Conditionals for release versions](#2017-09-06-Conditionals-for-release-versions)
    - [2017-08-11: Identify Vagrantboxes](#2017-08-11-Identify-Vagrantboxes)
  - [Vagrant](#Vagrant)
    - [2017-12-01: NFS share on Ubuntu](#2017-12-01-NFS-share-on-Ubuntu)
    - [2017-08-08: PHP-FPM not running after vagrant up (Vagrantbox by bento)](#2017-08-08-PHP-FPM-not-running-after-vagrant-up-Vagrantbox-by-bento)
    - [2017-07-31: Basic command list](#2017-07-31-Basic-command-list)
  - [Git](#Git)
    - [2017-08-10: Revert git commits](#2017-08-10-Revert-git-commits)
    - [2017-07-17: Git user switcher](#2017-07-17-Git-user-switcher)
- [License](#License)
  

<div id='Hint'/>

# Hint

Please check the [Github repository](https://github.com/neikei/notes) if a code block isn't displayed properly.
<div id='Notes'/>

# Notes
<div id='Linux'/>

## Linux
<div id='2017-12-13-Simple-disk-usage-monitoring'/>

### 2017-12-13: Simple disk usage monitoring

Bash snippet to monitor disk usage on non-production systems.

```bash
#!/bin/bash
USED=`df /dev/sda1 | awk '{print $5}' | sed -ne 2p | cut -d"%" -f1`
if [ "$USED" -gt 90 ]; then
    echo "NOT OK: disk usage is above $USED percent."
    # Add some alerting via mail or chat here
else
    echo "OK: $USED disk space used."
fi
```
<div id='2017-12-06-Screenfetch'/>

### 2017-12-06: Screenfetch

[Screenfetch](https://github.com/KittyKatt/screenFetch) is a bash tool to display system information.

```bash
#: Install nfs-kernel-server
neikei@workstation:~$ sudo apt install screenfetch

#: Add the following line to the end of your ~/.bashrc or ~/.zshrc
if [ -f /usr/bin/screenfetch ]; then echo ""; screenfetch; echo ""; fi

#: Example output during shell start

                          ./+o+-       neikei@workstation
                  yyyyy. 'yyyyyy+      OS: Ubuntu 16.04 xenial
              .;//+/////h yyyyyyo      Kernel: x86_64 Linux 4.4.0-67-generic
           .++ .:/++++++/-.`sss/`      Uptime: 5h 41m
         .:++o: `\++++++++/:---:/-     Packages: 2273
        o:+o+:++. `````'-/ooo+++++\    Shell: zsh 5.1.1
       .:+o:+o/.          `+sssooo+\   Resolution: 5760x1200
  .++/+ +oo+o:`             \sssooo;   DE: GNOME
 /+++//+: oo+o               ```````   WM: GNOME Shell
 \+/+o+++ o++o               ydddhh+   WM Theme:
  .++.o+ +oo+:`             /dddhhh;   GTK Theme: Adwaita [GTK2/3]
       .+.o+oo:.           oddhhhh+    Icon Theme: Adwaita
        \+.++o+o` -,,,,.:ohdhhhhh+     Font: Cantarell 11
         `:o+++  ohhhhhhhhyo++os:      Disk: 154G / 242G (68%)
           .o: .syhhhhhhh'.oo++o.      CPU: Intel Core i7-6600U @ 4x 3.4GHz
               /osyyyyyyy.oooo+++\     RAM: 6102MiB / 15464MiB
                   ````` +oo+++o:/
                          `oo++'`

```
<div id='2017-11-27-Locate,-partition-and-create-filesystem-on-new-disk'/>

### 2017-11-27: Locate, partition and create filesystem on new disk

History of the attachment of a new disk to a CentOS 7.4 VM.

```bash
#: Compare the list of available devices and mounted devices to locate the new device
[root@localhost ~]# echo "Available devices:" && ls /dev/sd? | sort && echo "Available partitions:" && ls /dev/sd?? | sort
Available devices:
/dev/sda
/dev/sdb
/dev/sdc
Available partitions:
/dev/sda1
/dev/sda2
/dev/sdb1
#: /dev/sdc is the new device, because it has no available partition yet

#: Check available partitions
[root@localhost ~]# fdisk /dev/sdc
Command (m for help): p

Disk /dev/sdc: 8589 MB, 8589934592 bytes, 16777216 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x7b407523

   Device Boot      Start         End      Blocks   Id  System

#: Create new partition
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

#: Write the partition to the disk
Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.

#: Re-check available partitions
Command (m for help): p

Disk /dev/sdc: 8589 MB, 8589934592 bytes, 16777216 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x7b407523

   Device Boot      Start         End      Blocks   Id  System
/dev/sdc1            2048    16777215     8387584   83  Linux

#: Create a filesystem on the new created partition
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

#: Mount the new filesystem
[root@localhost ~]# mount /dev/sdc1 /mnt/

#: Add the new created partition to /etc/fstab file if it should be mounted during the boot process
```
<div id='2017-11-22-System-CLI-monitoring'/>

### 2017-11-22: System CLI monitoring

CLI tools for monitoring the system.

```bash
#: Overview of CPU, RAM, load and processes
top

#: Like top but with interactive fitlers and coloured
htop

#: MySQL processes
mytop

#: Disk usage in human-readable format
df -h

#: Read and write operations
iotop

#: Network traffic
iftop

#: Network packets
iptraf

#: Dump network traffic
tcpdump
```
<div id='2017-11-21-System-versions'/>

### 2017-11-21: System versions

Snippets to check system versions on debian based systems.

```bash
#: Show kernel version
neikei@workstation:~$ uname -r
4.4.0-67-generic

#: Show debian version
neikei@workstation:~$ cat /etc/debian_version
stretch/sid

#: Show os release
neikei@workstation:~$ cat /etc/os-release
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial

#: Use lsb_release to check os version
neikei@workstation:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.3 LTS
Release:    16.04
Codename:   xenial
```
<div id='2017-11-11-Search-and-replace-strings-in-files'/>

### 2017-11-11: Search and replace strings in files

Just some basic snippets to search and replace in text files e.g. config files with sed and vim.

**sed**

```bash
#: Search and replace in the whole file
sed -i -e 's/search/replace/g' file.txt
```

**vim**

```bash
#: Open your file with vim
vim file.txt

#: Search and replace only next match after the current cursor position
:s/search/replace/g

#: Search and replace in the whole file
:%s/search/replace/g
```
<div id='2017-10-28-Pin-ansible-apt-package'/>

### 2017-10-28: Pin ansible apt package

The simplest solution is apt-mark, but the solution with apt preferences is more flexible.

**apt-mark:** Prevent the package from being automatically installed, upgraded or removed.

```bash
#: Set ansible package to hold
sudo apt-mark hold ansible

#: Show packages on hold
sudo apt-mark showhold
   ansible

#: Set ansible package to unhold
sudo apt-mark unhold ansible
```

**apt preferences:** Pin the package to a specific version, but allow apt to update the package  with patches.

```bash
#: Pin ansible package
echo "Package: ansible
Pin: version 2.1.*
Pin-Priority: 1000" | sudo tee /etc/apt/preferences.d/ansible

#: Unpin ansible package
sudo rm /etc/apt/preferences.d/ansible
```
<div id='2017-10-28-Install-specific-apt-package-version'/>

### 2017-10-28: Install specific apt package version

Example of the ansible package installation on Ubuntu.

```bash
#: Check available ansible packages
sudo apt-cache madison ansible
   ansible | 2.4.1.0-1ppa~xenial | http://ppa.launchpad.net/ansible/ansible/ubuntu xenial/main amd64 Packages
   ansible | 2.4.1.0-1ppa~xenial | http://ppa.launchpad.net/ansible/ansible/ubuntu xenial/main i386 Packages
   ansible | 2.1.1.0-1~ubuntu16.04.1 | http://de.archive.ubuntu.com/ubuntu xenial-backports/universe amd64 Packages
   ansible | 2.1.1.0-1~ubuntu16.04.1 | http://de.archive.ubuntu.com/ubuntu xenial-backports/universe i386 Packages

#: Install the required ansible package
sudo apt install ansible=2.1.1.0-1~ubuntu16.04.1
```
<div id='2017-10-20-SystemD-multi-spawn-processes'/>

### 2017-10-20: SystemD multi spawn processes

This great [documentation on StackExchange](https://unix.stackexchange.com/questions/288236/have-systemd-spawn-n-processes#288310) explains how to spawn multi processes with SystemD.
<div id='2017-10-15-Ubuntu-optimize-jpeg-images'/>

### 2017-10-15: Ubuntu optimize jpeg images

The jpegoptim tool optimizes jpg images and compresses them without loss of quality.

```bash
#: Install jpegoptim
sudo apt install jpegoptim

#: Optimize a single image. Caution: this will overwrite the original image.
jpegoptim ./pictures/testimage.jpg
./Pictures/testimage.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.

#: Optimize a single file and store it in a different directory to keep the original image.
jpegoptim ./pictures/testimage.jpg --dest="/tmp/"
./Pictures/testimage.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.

#: Optimize images of a find result
find . -type f -regextype posix-extended -regex "^.*\.(jpg|jpeg|JPG|JPEG)$" -exec jpegoptim {} \;
./Pictures/testimage1.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.
./Pictures/testimage2.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.
```
<div id='2017-10-04-Debian-ntpdate-time-synchronization'/>

### 2017-10-04: Debian ntpdate time synchronization

Configure ntpdate to synchronize the time with the internet hourly. Especially recommended for VMs in a network without a self-hosted ntp server. 

```bash
#: Remove ntp if it is installed
sudo apt remove ntp

#: Install ntpdate
sudo apt install ntpdate

#: Configure cron to resync the time hourly
echo $'#!/bin/bash\n/usr/sbin/ntpdate -s pool.ntp.org' | sudo tee /etc/cron.hourly/ntpdate
sudo chmod +x /etc/cron.hourly/ntpdate
```
<div id='2017-09-21-Bash-condition-to-check-if-file-is-directory'/>

### 2017-09-21: Bash condition to check if file is directory

The tilde as indicator for the home directory isn't interpreted right during a bash condition validation.

```bash
#: problematic condition
if [ -d "~/directory" ]; then echo "... is a directory."; fi

#: working condition
if [ -d "$HOME/directory" ]; then echo "... is a directory."; fi
```
<div id='2017-08-21-Database-replication-status'/>

### 2017-08-21: Database replication status

Bash snippets to check the database replication.

```bash
#: MySQL slave status
mysql -e "SHOW SLAVE STATUS \G"

#: MySQL slave status as watch to refresh every 2 seconds
watch -n 2 'mysql -e "SHOW SLAVE STATUS \G"'

#: MySQL replication lag only
mysql -e 'SHOW SLAVE STATUS \G' | grep Seconds_Behind_Master

#: PostgreSQL replication lag only
cd /tmp && sudo -u postgres psql -d postgres -c "SELECT CASE WHEN pg_last_xlog_receive_location() = pg_last_xlog_replay_location()
    THEN 0
    ELSE EXTRACT (EPOCH FROM now() - pg_last_xact_replay_timestamp())
END AS replication_lag_in_seconds;"
```
<div id='2017-08-14-Validate-archives'/>

### 2017-08-14: Validate archives

Bash snippets to validate the most common archives.

```bash
#: Validate .tar.gz archives
tar -tzf archive.tar.gz >/dev/null

#: Validate .tar archives
tar -tf archive.tar >/dev/null

#: Validate .gz archives
gzip -t archive.gz

#: Validate .bz2 archives
bzip2 -t archive.bz2

#: Validate .zip archives
zip -T archive.zip
```
<div id='2017-08-12-Install-Oracle-Java-8-on-Debian-Stretch'/>

### 2017-08-12: Install Oracle Java 8 on Debian Stretch

```bash
#: Install the network service dirmngr to manage certificate servers
apt install dirmngr

#: Add the repository and the repository key
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

#: Update package informations
apt update

#: Install Java
apt install oracle-java8-installer
```
<div id='2017-07-16-Command-line-convenience'/>

### 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

<div id='bashrc'/>

#### ~/.bashrc

- Prevent inadvertently crontab deletions
- Add execution time to bash history

```bash
function crontab {
    if [[ $* == *"-r"* ]];
    then
        echo "INFO: crontab -r is blocked to prevent inadvertently crontab deletions."
    else
        /usr/bin/crontab $*
    fi
}

HISTTIMEFORMAT="%d.%m.%y %T "
```

<div id='inputrc'/>

#### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

<div id='vimrc'/>

#### ~/.vimrc

- Color theme
- Line numbers
- Syntax highlighting

```bash
" Color theme for dark backgrounds
:color desert

" Show line numbers
set number

" Enable syntax highlighting
syntax on
```
<div id='2017-07-15-Fix-locale-warnings-on-Linux-servers'/>

### 2017-07-15: Fix locale warnings on Linux servers

**Problem:** Warnings about wrong or missing locale configurations

```bash
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
LANGUAGE = (unset),
LC_ALL = (unset),
LC_PAPER = "de_DE.UTF-8",
LC_ADDRESS = "de_DE.UTF-8",
LC_MONETARY = "de_DE.UTF-8",
LC_NUMERIC = "de_DE.UTF-8",
LC_TELEPHONE = "de_DE.UTF-8",
LC_IDENTIFICATION = "de_DE.UTF-8",
LC_MEASUREMENT = "de_DE.UTF-8",
LC_CTYPE = "en_US.UTF-8",
LC_TIME = "de_DE.UTF-8",
LC_NAME = "de_DE.UTF-8",
LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
```

**Solution 1: dpkg-reconfigure:** Use dpkg-reconfigure to configure LC_ALL

```bash
sudo dpkg-reconfigure locales
```

**Solution 2: /etc/default/locale:** Set LC_ALL in the default local configuration

```bash
sudo su -
echo LC_ALL="en_US.UTF-8" >> /etc/default/locale
```
<div id='2017-07-15-summarizeMD'/>

### 2017-07-15: summarizeMD

summarizeMD is a ruby script to create a table of contents for Markdown files. The short [bash script](https://github.com/neikei/notes/blob/master/tools/createReadme.sh) will merge all Markdown files before the run of [summarizeMD.rb](https://github.com/neikei/notes/blob/master/tools/summarizeMD.rb).

- [Script by velthune](https://github.com/velthune/summarizeMD)
- [Improvements by Kreinoee](https://github.com/Kreinoee/summarizeMD)
<div id='Windows'/>

## Windows
<div id='2018-01-03-ASUS-Zenbook-UX310UA-FanControl'/>

### 2018-01-03: ASUS Zenbook UX310UA FanControl

- Download and install the newest version of [NoteBook FanControl](https://github.com/hirschmann/nbfc/releases)
- Start NoteBook FanControl
- Select the required config
- Set the Fan control service status to enabled
- Enable autostart in the settings
<div id='2017-12-26-Linux-system-administrator-tools'/>

### 2017-12-26: Linux system administrator tools

- [PuTTY](http://www.putty.org/) / [mRemoteNG](https://github.com/mRemoteNG/mRemoteNG)
- [Visual Studio Code](https://code.visualstudio.com)
  - **Extensions:**
  - [vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)
  - [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
  - [Ansible](https://marketplace.visualstudio.com/items?itemName=vscoss.vscode-ansible)
  - [Git Blame](https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame)
- [SourceTree](https://www.sourcetreeapp.com/)
- [Ubuntu Bash](https://neikei.github.io/notes/#2017-12-15-Ubuntu-Bash-installation-on-Windows-10)
- [KeePassX](https://github.com/keepassx/keepassx)
- [Virtualbox, Git and Vagrant](https://github.com/neikei/install-vagrant-on-windows)

**Visual Studio Code** line endings on Windows are CRLF. Change it to LF if you want to use your code on Linux/Unix systems.
<div id='2017-12-15-Ubuntu-Bash-installation-on-Windows-10'/>

### 2017-12-15: Ubuntu Bash installation on Windows 10

1. Enable "Windows Subsystem for Linux" in the "Windows Features" settings
2. Restart Windows
3. Install "Ubuntu" from the "Microsoft Store"
4. Start Ubuntu

```bash
Installing, this may take a few minutes...
Installation successful!
Please create a default UNIX user account. The username does not need to match your Windows username.
For more information visit: https://aka.ms/wslusers
Enter new UNIX username: neikei
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Default UNIX user set to: neikei
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

neikei@workstations:~$ cat /etc/os-release
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial
```
<div id='Continuous-Integration-&-Continuous-Delivery'/>

## Continuous Integration & Continuous Delivery
<div id='2017-12-21-Bamboo-JUnit-Parser-fake-results-for-hotfixes'/>

### 2017-12-21: Bamboo JUnit Parser fake results for hotfixes

Bamboo task to create fake testresults for the JUnit Parser if a hotfix build is running without the execution of tests.

```bash
#!/bin/bash

#: Pre-Check
is_hotfix=`git rev-parse --abbrev-ref HEAD | grep "hotfix" | wc -l`

#: Run Coveragechecks
if [ $is_hotfix -eq 1 ]; then

echo '<?xml version="1.0" encoding="UTF-8"?>
<testsuites>
  <testsuite name="Hotfix Fake Test Suite" tests="1" assertions="0" failures="0" errors="0" time="0.01">
      <testcase name="Hotfix Fake Test"/>
  </testsuite>
</testsuites>' > phpunit_hotfix_fake_results.xml

fi
```
<div id='2017-11-23-Common-HTTP-status-codes'/>

### 2017-11-23: Common HTTP status codes

| Code | Description           |
|------|-----------------------|
| 200  | OK                    |
| 201  | Created               |
| 204  | No content            |
| 301  | Moved permanently     |
| 304  | Not modified          |
| 307  | Temporary redirect    |
| 400  | Bad request           |
| 401  | Unauthorized          |
| 403  | Forbidden             |
| 404  | Not found             |
| 405  | Method not allowed    |
| 500  | Internal server error |
| 502  | Bad Gateway           |
| 504  | Gateway timeout       |

[Great overview with further explanations.](http://www.restapitutorial.com/httpstatuscodes.html)
<div id='2017-10-26-Bamboo-branch-based-configs'/>

### 2017-10-26: Bamboo branch based configs

Bamboo task for branch based configuration replacements. The following example will only replace the config if the current branch is develop.

```bash
#!/bin/bash

current_branch_name=`git rev-parse --abbrev-ref HEAD`
echo "==> Branch: $current_branch_name"

if [[ $current_branch_name =~ ^develop$ ]]; then

    sed -i "s/placeholder/value/g" app/config/parameters.yml.dist

fi
```
<div id='2017-09-26-Jenkins-centralized-syntaxchecks'/>

### 2017-09-26: Jenkins centralized syntaxchecks

Installation of syntaxchecks for web applications on a Linux Jenkins server.

```bash
#: Install syntaxchecks in the home path of the jenkins application user
su - jenkins
cd ~
git clone https://github.com/neikei/syntaxchecks.git
```

Jenkins task to execute the sytaxchecks during the build process.

```bash
#: Execute syntaxchecks to validate all changed files in the last commit and stop in case of an error
~/syntaxchecks/syntaxchecks.sh -p "`pwd`" -c 1 -s
```
<div id='2017-09-19-Bamboo-centralized-syntaxchecks'/>

### 2017-09-19: Bamboo centralized syntaxchecks

Installation of syntaxchecks for web applications on a Linux Bamboo server.

```bash
#: Install syntaxchecks in the home path of the bamboo application user
su - bamboo
cd ~
git clone https://github.com/neikei/syntaxchecks.git
```

Bamboo task to execute the sytaxchecks during the build process.

```bash
#: Execute syntaxchecks to validate all changed files in the last commit and stop in case of an error
~/syntaxchecks/syntaxchecks.sh -p "${bamboo.build.working.directory}" -c 1 -s
```
<div id='2017-09-18-Deploy-archives-with-Bamboo-and-PHP-Deployer'/>

### 2017-09-18: Deploy archives with Bamboo and PHP Deployer

Bamboo task to create the archive during the deployment process.

```bash
#: Create tarball and remove archived files
tar cfz artifact.tar.gz * --remove-files
```

PHP Deployer task to extract the archive on a remote server.

```php
// Extract archive on a remote server
desc('Extract archive');
task('archive:extract', function () {
    run('cd {{ release_path }} && tar xf artifact.tar.gz && rm artifact.tar.gz');
});

// Deploy process
desc('Deploy');
task('deploy', [
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'rsync',
    'archive:extract',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
    'success'
]);
```
<div id='2017-09-15-Use-PHP-Deployer-with-Bamboo'/>

### 2017-09-15: Use PHP Deployer with Bamboo

Use PHP Deployer to simplify Bamboo deployments to a bunch of servers.

- [Bamboo](https://www.atlassian.com/software/bamboo)
- [PHP Deployer](https://deployer.org/)

**PHP Deployer placement:** Place the scripts in the home directory of the bamboo application user in a subfolder named "deployer" and create an own subfolder for every deployment project.

```bash
~/deployer/$project/deploy.php
~/deployer/$project/composer.json
```

Hint: "composer update" is needed in every project directory.

**Bamboo task** to execute PHP Deployer scripts during the deployment process.

```bash
#: Config
project=<projectname>
stage=<stage>

#: Deployment
logfile="/tmp/$project-$stage.log"

#: Change into the directroy of your deployer scripts and start the deployment with the build directory as parameter
cd ~/deployer/$project
php vendor/bin/dep deploy $stage --artifact_directory="${bamboo.build.working.directory}" -vv 2>&1 | tee $logfile

#: Check Result
errors=`grep "\[FatalException\]\|RuntimeException\|\[Error\]\|Fatal error\|Exception trace\|General error" $logfile | wc -l`
if [ $errors -ne 0 ]; then
    echo "==> Deployer failed... Check the output above.";
    exit 1;
else
    echo "==> Deployer finished.";
fi
```

**PHP Deployer** modifications to use a Bamboo build directory for the deployment.

```php
// Include Symfony component for input options
use Symfony\Component\Console\Input\InputOption;

// Get artifact directory from start parameters
option('artifact_directory', null, InputOption::VALUE_REQUIRED, 'Artifact directory');

// Set rsync source to artifact directory
set('rsync_src', function () {
    return input()->getOption('artifact_directory');
});
```
<div id='2017-09-14-Bamboo-htaccess-authentication-errors'/>

### 2017-09-14: Bamboo htaccess authentication errors

Bamboo .htaccess restricted authentication will be forwarded to the Tomcat which can cause some authentication errors. It is possible to prevent the forwarding with the following proxy header setting in the Nginx configuration.

```bash
proxy_set_header   Authorization "";
```
<div id='2017-08-07-HipChat-notifications'/>

### 2017-08-07: HipChat notifications

Bash snippets for HipChat notifications.

```bash
#: HipChat API v2
curl -X POST \
     -H "Content-Type: application/json" \
     --data "{ \"color\":\"green\", \"message\":\"HipCHat API v2\", \"message_format\":\"text\" }" \
     https://api.hipchat.com/v2/room/<room_api_id>/notification?auth_token=<auth_token>

#: HipChat API v1
curl --data "from=Sender&room_id=<room_api_id>&message=%28successful%29+HipChat+API+v1+&message_format=text&color=green" "https://api.hipchat.com/v1/rooms/message?format=json&auth_token=<auth_token>"
```

Further links:

- [Official HipChat Documentation](https://www.hipchat.com/docs/apiv2/method/send_room_notification)
<div id='2017-08-01-Bamboo-workaround-for-empty-directories-in-artifacts'/>

### 2017-08-01: Bamboo workaround for empty directories in artifacts

**Problem:** Bamboo doesn't allow empty directories in artifacts. See [Bamboo issue tracking](https://jira.atlassian.com/browse/BAM-14358).

**Workaround 1 - Logging:** Write empty directories into a file during the build process and re-create them during the deployment process.

Build step:

```bash
#: Find empty directories and write them into a logging file
find . -empty -type d > empty_directories.txt
```

Deployment step:

```bash
#: Create empty directories based on the logging file
cat empty_directories.txt | while read directory; do
    mkdir -p $directory
done
```

**Workaround 2 - Archive:** Create an archive during the build process and extract it during the deployment process.

Build step:

```bash
#: Create tar.gz archive of all files and remove base files
tar czf artifact.tar.gz * --remove-files
```

Deployment step:

```bash
#: Extract archive and remove it
tar xzfv artifact.tar.gz && rm artifact.tar.gz
```
<div id='2017-07-20-Syntaxchecks'/>

### 2017-07-20: Syntaxchecks

Bash snippets to check the syntax of other files.

<div id='PHP'/>

#### PHP

Syntaxchecks for PHP files.

```bash
#: Syntaxcheck for one file
php -l <file_name>

#: Syntaxcheck for all files in the current directory
find . -name "*.php" -exec php -l {} \;

#: Syntaxcheck for all files in the last Git commit
git diff --name-only --diff-filter=ACMR HEAD~1..HEAD | grep -E "^.*.php$" | xargs -i php -l {}
```

<div id='YAML'/>

#### YAML

Syntaxchecks for YAML files.

```bash
#: Syntaxcheck for one file
ruby -e "require 'yaml';puts YAML.load_file('<file_name>')"

#: Syntaxcheck for all files in the current directory
for file in `find . -name "*.yaml"`
do
  ruby -e "require 'yaml';puts YAML.load_file(\"$file\")" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "No syntax errors detected in $file"
  else
    echo "Some syntax errors detected in $file"
  fi
done

#: Syntaxcheck for all files in the last Git commit
for file in `git diff --name-only --diff-filter=ACMR HEAD~1..HEAD | grep -E "^.*.yaml$"`
do
  ruby -e "require 'yaml';puts YAML.load_file(\"$file\")" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "No syntax errors detected in $file"
  else
    echo "Some syntax errors detected in $file"
  fi
done
```
<div id='Ansible'/>

## Ansible
<div id='2018-01-02-Load-variables-based-on-distribution-information'/>

### 2018-01-02: Load variables based on distribution information

The Ansible Snippet will search in the vars/ folder of a role and loads the variables of the first found file.

```yaml
- name: Load variables based on distributon information
  include_vars: "{{ item }}"
  with_first_found:
    - "{{ ansible_distribution }}-{{ ansible_distribution_version }}.yml"
    - "{{ ansible_distribution }}.yml"
    - "{{ ansible_os_family }}.yml"
    - "default.yml"
```
<div id='2017-09-06-Conditionals-for-release-versions'/>

### 2017-09-06: Conditionals for release versions

Ansible tasks examples:

```yaml
- name: "Run only on Debian 8"
  debug:
    msg: "OS: {{ ansible_distribution }} // Version: {{ ansible_distribution_major_version }}"
  when: (ansible_distribution == "Debian" and ansible_distribution_major_version == "8")

- name: "Run on Debian 8 and Debian 9"
  debug:
    msg: "OS: {{ ansible_distribution }} // Version: {{ ansible_distribution_major_version }}"
  when: (ansible_distribution == "Debian" and ansible_distribution_major_version == "8") or
        (ansible_distribution == "Debian" and ansible_distribution_major_version == "9")
```

Jinja2 template examples for the [template module](http://docs.ansible.com/ansible/latest/template_module.html):

```yaml
{% if ansible_distribution_major_version == '8' %}
Debian 8
{% endif %}

{% if ansible_distribution_major_version == '8' or ansible_distribution_major_version == '9' %}
Debian 8 or Debian 9
{% endif %}
```
<div id='2017-08-11-Identify-Vagrantboxes'/>

### 2017-08-11: Identify Vagrantboxes

Ansible snippet to identify Vagrantboxes.

```yaml
- name: Check if Server is a Vagrantbox
  shell: 'grep vagrant /etc/passwd | wc -l'
  check_mode: no
  changed_when: false
  register: vagrantbox

- name: Server is a vagrantbox
  debug: msg="Server is a vagrantbox"
  when: vagrantbox.stdout != "0"

- name: Server is not a vagrantbox
  debug: msg="Server is not a vagrantbox"
  when: vagrantbox.stdout == "0"
```
<div id='Vagrant'/>

## Vagrant
<div id='2017-12-01-NFS-share-on-Ubuntu'/>

### 2017-12-01: NFS share on Ubuntu

NFS is the fastest Vagrant Share and the following snippet will explain how to use it on Ubuntu.

```bash
#: Install nfs-kernel-server
neikei@workstation:~$ sudo apt install nfs-kernel-server

#: Add the following line to the Vagrantfile
config.vm.synced_folder ".", "/vagrant", id: "v-root", mount_options: ["rw", "tcp", "nolock", "noacl", "async"], type: "nfs", nfs_udp: false

#: Vagrant up
neikei@workstation:~$ vagrant up
...
==> default: Exporting NFS shared folders...
==> default: Preparing to edit /etc/exports. Administrator privileges will be required...
[sudo] password for neikei:
● nfs-server.service - NFS server and services
   Loaded: loaded (/lib/systemd/system/nfs-server.service; enabled; vendor preset: enabled)
   Active: active (exited) since Fr 2017-12-01 08:04:48 CET; 1h 30min ago
  Process: 1269 ExecStart=/usr/sbin/rpc.nfsd $RPCNFSDARGS (code=exited, status=0/SUCCESS)
  Process: 1266 ExecStartPre=/usr/sbin/exportfs -r (code=exited, status=0/SUCCESS)
 Main PID: 1269 (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/nfs-server.service

Dez 01 08:04:48 workstation systemd[1]: Starting NFS server and services...
Dez 01 08:04:48 workstation systemd[1]: Started NFS server and services.
==> default: Mounting NFS shared folders...
...
```
<div id='2017-08-08-PHP-FPM-not-running-after-vagrant-up-Vagrantbox-by-bento'/>

### 2017-08-08: PHP-FPM not running after vagrant up (Vagrantbox by bento)

The Vagrantboxes from the [bento project](https://github.com/chef/bento) are really good, but the PHP-FPM service didn't start properly during a vagrant up. So I did some research and found a cleanup script (/etc/init.d/mountall-bootclean.sh) which is executed during every startup and removes temporary directories like /var/run where the PHP-FPM socket was placed. Move the socket to a static directory or use the following provisioning command in your Vagrantfile to ensure the PHP-FPM is running after a vagrant up.

```bash
#: Ensure PHP-FPM and Nginx restart after vagrant up
config.vm.provision "shell", inline: "service php7.1-fpm restart && service nginx restart", run: "always"
```
<div id='2017-07-31-Basic-command-list'/>

### 2017-07-31: Basic command list

Basic commands for Vagrant.

```bash
#: Show Vagrant Version
vagrant --version

#: Show installed plugins and versions
vagrant plugin list

#: Create Vagrantfile based on a box from https://app.vagrantup.com/
vagrant init debian/stretch64

#: Start the virtual machine based on the Vagrantfile
vagrant up

#: Show the status of the virtual machine
vagrant status

#: Connect to the virtual machine
vagrant ssh

#: Stop the virtual machine
vagrant halt

#: Destroy the virtual machine
vagrant destroy

#: Validate the Vagrantfile
vagrant validate
```

Further links:

- [Official Vagrant Documentation](https://www.vagrantup.com/docs/index.html)
- [Vagrant installation guide for Windows](https://github.com/neikei/install-vagrant-on-windows)
- [Vagrantbox for web development](https://github.com/neikei/vagrant-debian-ansible-lemp)
<div id='Git'/>

## Git
<div id='2017-08-10-Revert-git-commits'/>

### 2017-08-10: Revert git commits

Git snippets to revert commits.

```bash
#: Revert the last commit
git revert HEAD

#: Revert a specific commit by commit id
git revert <commit_id>

#: Revert the last merge
git revert -m1 HEAD

#: Revert a specific merge by commit id
git revert -m1 <commit_id>
```
<div id='2017-07-17-Git-user-switcher'/>

### 2017-07-17: Git user switcher

Bash script to switch between git accounts.

```bash
#!/bin/bash
echo "";
echo "1) <name_account1>";
echo "2) <name_account2>";
echo "";

while true; do
    read -p "Which account do you need? " choice
    case $choice in
        [1]* ) git config --global --replace-all user.name "<username_account1>"; git config --global user.email "<usermail_account1>"; break;;
        [2]* ) git config --global --replace-all user.name "<username_account2>"; git config --global user.email "<usermail_account2>"; break;;
        * ) echo "Please answer 1 or 2.";;
    esac
done

mail=`git config --global user.email`;
user=`git config --global user.name`;

echo "";
echo "############ Activated ############";
echo "User: $user";
echo "Mail: $mail";
echo "";
```
<div id='License'/>

# License

This are just a few notes without any warranty. Please check the license [here](https://github.com/neikei/notes/blob/master/LICENSE).

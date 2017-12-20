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

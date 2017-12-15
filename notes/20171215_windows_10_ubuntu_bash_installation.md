## 2017-12-15: Windows 10 Ubuntu Bash installation

1. Enable "Windows Subsystem for Linux" in the "Windows Features" area
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

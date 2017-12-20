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

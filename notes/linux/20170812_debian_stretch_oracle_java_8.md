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

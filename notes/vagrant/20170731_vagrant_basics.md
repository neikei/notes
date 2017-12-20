### 2017-07-31: Vagrant Basics

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

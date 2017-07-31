## 2017-07-31: Vagrant Basics

Basic commands for Vagrant.

```bash
# Desc: Show Vagrant Version
vagrant --version

# Desc: Show installed plugins and versions
vagrant plugin list

# Desc: Create Vagrantfile based on a box from https://app.vagrantup.com/
vagrant init debian/stretch64

# Desc: Start the virtual machine based on the Vagrantfile
vagrant up

# Desc: Show the status of the virtual machine
vagrant status

# Desc: Connect to the virtual machine
vagrant ssh

# Desc: Stop the virtual machine
vagrant halt

# Desc: Destroy the virtual machine
vagrant destroy

# Desc: Validate the Vagrantfile
vagrant validate
```

Further links:

- [Official Vagrant Documentation](https://www.vagrantup.com/docs/index.html)
- [Vagrant installation guide for Windows](https://github.com/neikei/install-vagrant-on-windows)
- [Vagrantbox for web development](https://github.com/neikei/vagrant-debian-ansible-lemp)

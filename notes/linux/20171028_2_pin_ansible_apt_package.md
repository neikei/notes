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

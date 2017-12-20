### 2017-12-01: Vagrant NFS share on Ubuntu

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

### 2018-02-05: Re-sync default shared directory

Snippet to re-sync the default shared directory between the host and a Vagrantbox managed by Virtualbox.

```bash
#: Re-sync shared directory
neikei@workstation:~/vagrant/testing$ vagrant rsync
==> default: Rsyncing folder: /home/neikei/vagrant/testing/ => /vagrant
```

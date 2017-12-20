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

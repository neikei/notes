## 2017-08-08: PHP-FPM not running after vagrant up

The Vagrantboxes from the [vagrant website](https://app.vagrantup.com/debian/boxes/jessie64) are really good, but the PHP-FPM service didn't start properly during a vagrant up. So I did some research and found a cleanup script (/etc/init.d/mountall-bootclean.sh) which is executed during every startup and removes temporary directories like /var/run where the PHP-FPM socket was placed. Move the socket to a static directory or use the following provisioning command in your Vagrantfile to ensure the PHP-FPM is running after a vagrant up.

```bash
# Desc: Ensure PHP-FPM and Nginx restart after vagrant up
config.vm.provision "shell", inline: "service php7.1-fpm restart && service nginx restart", run: "always"
```

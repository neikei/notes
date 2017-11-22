# Summary 

- [Hint](#Hint)
- [Notes](#Notes)
  - [2017-11-22: System CLI monitoring](#2017-11-22-System-CLI-monitoring)
  - [2017-11-21: System versions](#2017-11-21-System-versions)
  - [2017-11-11: Search and replace strings in files](#2017-11-11-Search-and-replace-strings-in-files)
  - [2017-10-28: Pin ansible apt package](#2017-10-28-Pin-ansible-apt-package)
  - [2017-10-28: Install specific apt package version](#2017-10-28-Install-specific-apt-package-version)
  - [2017-10-26: Bamboo branch based configs](#2017-10-26-Bamboo-branch-based-configs)
  - [2017-10-20: SystemD multi spawn processes](#2017-10-20-SystemD-multi-spawn-processes)
  - [2017-10-15: Ubuntu optimize jpeg images](#2017-10-15-Ubuntu-optimize-jpeg-images)
  - [2017-10-04: Debian ntpdate time synchronization](#2017-10-04-Debian-ntpdate-time-synchronization)
  - [2017-09-26: Jenkins centralized syntaxchecks](#2017-09-26-Jenkins-centralized-syntaxchecks)
  - [2017-09-21: Bash condition to check directories](#2017-09-21-Bash-condition-to-check-directories)
  - [2017-09-19: Bamboo centralized syntaxchecks](#2017-09-19-Bamboo-centralized-syntaxchecks)
  - [2017-09-18: Deploy archives with Bamboo and PHP Deployer](#2017-09-18-Deploy-archives-with-Bamboo-and-PHP-Deployer)
  - [2017-09-15: Use PHP Deployer with Bamboo](#2017-09-15-Use-PHP-Deployer-with-Bamboo)
  - [2017-09-14: Bamboo htaccess authentication errors](#2017-09-14-Bamboo-htaccess-authentication-errors)
  - [2017-09-06: Ansible conditionals for release versions](#2017-09-06-Ansible-conditionals-for-release-versions)
  - [2017-08-21: Database replication status](#2017-08-21-Database-replication-status)
  - [2017-08-14: Validate archives](#2017-08-14-Validate-archives)
  - [2017-08-12: Install Oracle Java 8 on Debian Stretch](#2017-08-12-Install-Oracle-Java-8-on-Debian-Stretch)
  - [2017-08-11: Ansible snippet to identify Vagrantboxes](#2017-08-11-Ansible-snippet-to-identify-Vagrantboxes)
  - [2017-08-10: Revert git commits](#2017-08-10-Revert-git-commits)
  - [2017-08-08: PHP-FPM not running after vagrant up (Vagrantbox by bento)](#2017-08-08-PHP-FPM-not-running-after-vagrant-up-Vagrantbox-by-bento)
  - [2017-08-07: HipChat notifications](#2017-08-07-HipChat-notifications)
  - [2017-08-01: Bamboo workaround for empty directories in artifacts](#2017-08-01-Bamboo-workaround-for-empty-directories-in-artifacts)
  - [2017-07-31: Vagrant Basics](#2017-07-31-Vagrant-Basics)
  - [2017-07-20: Syntaxchecks](#2017-07-20-Syntaxchecks)
    - [PHP](#PHP)
    - [YAML](#YAML)
  - [2017-07-17: Git user switcher](#2017-07-17-Git-user-switcher)
  - [2017-07-16: Command line convenience](#2017-07-16-Command-line-convenience)
    - [~/.bashrc](#bashrc)
    - [~/.inputrc](#inputrc)
    - [~/.vimrc](#vimrc)
  - [2017-07-15: Fix locale warnings on Linux servers](#2017-07-15-Fix-locale-warnings-on-Linux-servers)
  - [2017-07-15: summarizeMD](#2017-07-15-summarizeMD)
- [License](#License)
  

<div id='Hint'/>

# Hint

Please check the [Github repository](https://github.com/neikei/notes) if a code block isn't displayed properly.
<div id='Notes'/>

# Notes
<div id='2017-11-22-System-CLI-monitoring'/>

## 2017-11-22: System CLI monitoring

CLI tools for monitoring the system.

```bash
# Desc: Overview of CPU, RAM, load and processes
top

# Desc: Like top but with interactive fitlers and coloured
htop

# Desc: MySQL processes
mytop

# Desc: Disk usage in human-readable format
df -h

# Desc: Read and write operations
iotop

# Desc: Network traffic
iftop

# Desc: Network packets
iptraf

# Desc: Dump network traffic
tcpdump
```
<div id='2017-11-21-System-versions'/>

## 2017-11-21: System versions

Snippets to check system versions on debian based systems.

```bash
# Desc: Show kernel version
neikei@workstation:~$ uname -r
4.4.0-67-generic

# Desc: Show debian version
neikei@workstation:~$ cat /etc/debian_version
stretch/sid

# Desc: Show os release
neikei@workstation:~$ cat /etc/os-release
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

# Desc: Use lsb_release to check os version
neikei@workstation:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.3 LTS
Release:    16.04
Codename:   xenial
```
<div id='2017-11-11-Search-and-replace-strings-in-files'/>

## 2017-11-11: Search and replace strings in files

Just some basic snippets to search and replace in text files e.g. config files with sed and vim.

**sed**

```bash
# Desc: Search and replace in the whole file
sed -i -e 's/search/replace/g' file.txt
```

**vim**

```bash
# Desc: Open your file with vim
vim file.txt

# Desc: Search and replace only next match after the current cursor position
:s/search/replace/g

# Desc: Search and replace in the whole file
:%s/search/replace/g
```
<div id='2017-10-28-Pin-ansible-apt-package'/>

## 2017-10-28: Pin ansible apt package

The simplest solution is apt-mark, but the solution with apt preferences is more flexible.

**apt-mark:** Prevent the package from being automatically installed, upgraded or removed.

```bash
# Desc: Set ansible package to hold
sudo apt-mark hold ansible

# Desc: Show packages on hold
sudo apt-mark showhold
   ansible

# Desc: Set ansible package to unhold
sudo apt-mark unhold ansible
```

**apt preferences:** Pin the package to a specific version, but allow apt to update the package  with patches.

```bash
# Desc: Pin ansible package
echo "Package: ansible
Pin: version 2.1.*
Pin-Priority: 1000" | sudo tee /etc/apt/preferences.d/ansible

# Desc: Unpin ansible package
sudo rm /etc/apt/preferences.d/ansible
```
<div id='2017-10-28-Install-specific-apt-package-version'/>

## 2017-10-28: Install specific apt package version

Example of the ansible package installation on Ubuntu.

```bash
# Desc: Check available ansible packages
sudo apt-cache madison ansible
   ansible | 2.4.1.0-1ppa~xenial | http://ppa.launchpad.net/ansible/ansible/ubuntu xenial/main amd64 Packages
   ansible | 2.4.1.0-1ppa~xenial | http://ppa.launchpad.net/ansible/ansible/ubuntu xenial/main i386 Packages
   ansible | 2.1.1.0-1~ubuntu16.04.1 | http://de.archive.ubuntu.com/ubuntu xenial-backports/universe amd64 Packages
   ansible | 2.1.1.0-1~ubuntu16.04.1 | http://de.archive.ubuntu.com/ubuntu xenial-backports/universe i386 Packages

# Desc: Install the required ansible package
sudo apt install ansible=2.1.1.0-1~ubuntu16.04.1
```
<div id='2017-10-26-Bamboo-branch-based-configs'/>

## 2017-10-26: Bamboo branch based configs

Bamboo task for branch based configuration replacements. The following example will only replace the config if the current branch is develop.

```bash
#!/bin/bash

current_branch_name=`git rev-parse --abbrev-ref HEAD`
echo "==> Branch: $current_branch_name"

if [[ $current_branch_name =~ ^develop$ ]]; then

    sed -i "s/placeholder/value/g" app/config/parameters.yml.dist

fi
```
<div id='2017-10-20-SystemD-multi-spawn-processes'/>

## 2017-10-20: SystemD multi spawn processes

This great [documentation on StackExchange](https://unix.stackexchange.com/questions/288236/have-systemd-spawn-n-processes#288310) explains how to spawn multi processes with SystemD.
<div id='2017-10-15-Ubuntu-optimize-jpeg-images'/>

## 2017-10-15: Ubuntu optimize jpeg images

The jpegoptim tool optimizes jpg images and compresses them without loss of quality.

```bash
# Desc: Install jpegoptim
sudo apt install jpegoptim

# Desc: Optimize a single image. Caution: this will overwrite the original image.
jpegoptim ./pictures/testimage.jpg
./Pictures/testimage.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.

# Desc: Optimize a single file and store it in a different directory to keep the original image.
jpegoptim ./pictures/testimage.jpg --dest="/tmp/"
./Pictures/testimage.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.

# Desc: Optimize images of a find result
find . -type f -regextype posix-extended -regex "^.*\.(jpg|jpeg|JPG|JPEG)$" -exec jpegoptim {} \;
./Pictures/testimage1.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.
./Pictures/testimage2.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.
```
<div id='2017-10-04-Debian-ntpdate-time-synchronization'/>

## 2017-10-04: Debian ntpdate time synchronization

Configure ntpdate to synchronize the time with the internet hourly. Especially recommended for VMs in a network without a self-hosted ntp server. 

```bash
# Desc: Remove ntp if it is installed
sudo apt remove ntp

# Desc: Install ntpdate
sudo apt install ntpdate

# Desc: Configure cron to resync the time hourly
echo $'#!/bin/bash\n/usr/sbin/ntpdate -s pool.ntp.org' | sudo tee /etc/cron.hourly/ntpdate
sudo chmod +x /etc/cron.hourly/ntpdate
```
<div id='2017-09-26-Jenkins-centralized-syntaxchecks'/>

## 2017-09-26: Jenkins centralized syntaxchecks

Installation of syntaxchecks for web applications on a Linux Jenkins server.

```bash
# Desc: Install syntaxchecks in the home path of the jenkins application user
su - jenkins
cd ~
git clone https://github.com/neikei/syntaxchecks.git
```

Jenkins task to execute the sytaxchecks during the build process.

```bash
# Desc: Execute syntaxchecks to validate all changed files in the last commit and stop in case of an error
~/syntaxchecks/syntaxchecks.sh -p "`pwd`" -c 1 -s
```
<div id='2017-09-21-Bash-condition-to-check-directories'/>

## 2017-09-21: Bash condition to check directories

The tilde as indicator for the home directory isn't interpreted right during a bash condition validation.

```bash
# Desc: problematic condition
if [ -d "~/directory" ]; then echo "... is a directory."; fi

# Desc: working condition
if [ -d "$HOME/directory" ]; then echo "... is a directory."; fi
```
<div id='2017-09-19-Bamboo-centralized-syntaxchecks'/>

## 2017-09-19: Bamboo centralized syntaxchecks

Installation of syntaxchecks for web applications on a Linux Bamboo server.

```bash
# Desc: Install syntaxchecks in the home path of the bamboo application user
su - bamboo
cd ~
git clone https://github.com/neikei/syntaxchecks.git
```

Bamboo task to execute the sytaxchecks during the build process.

```bash
# Desc: Execute syntaxchecks to validate all changed files in the last commit and stop in case of an error
~/syntaxchecks/syntaxchecks.sh -p "${bamboo.build.working.directory}" -c 1 -s
```
<div id='2017-09-18-Deploy-archives-with-Bamboo-and-PHP-Deployer'/>

## 2017-09-18: Deploy archives with Bamboo and PHP Deployer

Bamboo task to create the archive during the deployment process.

```bash
# Desc: Create tarball and remove archived files
tar cfz artifact.tar.gz * --remove-files
```

PHP Deployer task to extract the archive on a remote server.

```php
// Extract archive on a remote server
desc('Extract archive');
task('archive:extract', function () {
    run('cd {{ release_path }} && tar xf artifact.tar.gz && rm artifact.tar.gz');
});

// Deploy process
desc('Deploy');
task('deploy', [
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'rsync',
    'archive:extract',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
    'success'
]);
```
<div id='2017-09-15-Use-PHP-Deployer-with-Bamboo'/>

## 2017-09-15: Use PHP Deployer with Bamboo

Use PHP Deployer to simplify Bamboo deployments to a bunch of servers.

- [Bamboo](https://www.atlassian.com/software/bamboo)
- [PHP Deployer](https://deployer.org/)

**PHP Deployer placement:** Place the scripts in the home directory of the bamboo application user in a subfolder named "deployer" and create an own subfolder for every deployment project.

```bash
~/deployer/$project/deploy.php
~/deployer/$project/composer.json
```

Hint: "composer update" is needed in every project directory.

**Bamboo task** to execute PHP Deployer scripts during the deployment process.

```bash
# Desc: Config
project=<projectname>
stage=<stage>

# Desc: Deployment
logfile="/tmp/$project-$stage.log"

# Desc: Change into the directroy of your deployer scripts and start the deployment with the build directory as parameter
cd ~/deployer/$project
php vendor/bin/dep deploy $stage --artifact_directory="${bamboo.build.working.directory}" -vv 2>&1 | tee $logfile

# Desc: Check Result
errors=`grep "\[FatalException\]\|RuntimeException\|\[Error\]\|Fatal error\|Exception trace\|General error" $logfile | wc -l`
if [ $errors -ne 0 ]; then
    echo "==> Deployer failed... Check the output above.";
    exit 1;
else
    echo "==> Deployer finished.";
fi
```

**PHP Deployer** modifications to use a Bamboo build directory for the deployment.

```php
// Include Symfony component for input options
use Symfony\Component\Console\Input\InputOption;

// Get artifact directory from start parameters
option('artifact_directory', null, InputOption::VALUE_REQUIRED, 'Artifact directory');

// Set rsync source to artifact directory
set('rsync_src', function () {
    return input()->getOption('artifact_directory');
});
```
<div id='2017-09-14-Bamboo-htaccess-authentication-errors'/>

## 2017-09-14: Bamboo htaccess authentication errors

Bamboo .htaccess restricted authentication will be forwarded to the Tomcat which can cause some authentication errors. It is possible to prevent the forwarding with the following proxy header setting in the Nginx configuration.

```bash
proxy_set_header   Authorization "";
```
<div id='2017-09-06-Ansible-conditionals-for-release-versions'/>

## 2017-09-06: Ansible conditionals for release versions

Ansible tasks examples:

```yaml
- name: "Run only on Debian 8"
  debug:
    msg: "OS: {{ ansible_distribution }} // Version: {{ ansible_distribution_major_version }}"
  when: (ansible_distribution == "Debian" and ansible_distribution_major_version == "8")

- name: "Run on Debian 8 and Debian 9"
  debug:
    msg: "OS: {{ ansible_distribution }} // Version: {{ ansible_distribution_major_version }}"
  when: (ansible_distribution == "Debian" and ansible_distribution_major_version == "8") or
        (ansible_distribution == "Debian" and ansible_distribution_major_version == "9")
```

Jinja2 template examples for the [template module](http://docs.ansible.com/ansible/latest/template_module.html):

```yaml
{% if ansible_distribution_major_version == '8' %}
Debian 8
{% endif %}

{% if ansible_distribution_major_version == '8' or ansible_distribution_major_version == '9' %}
Debian 8 or Debian 9
{% endif %}
```
<div id='2017-08-21-Database-replication-status'/>

## 2017-08-21: Database replication status

Bash snippets to check the database replication.

```bash
# Desc: MySQL slave status
mysql -e "SHOW SLAVE STATUS \G"

# Desc: MySQL slave status as watch to refresh every 2 seconds
watch -n 2 'mysql -e "SHOW SLAVE STATUS \G"'

# Desc: MySQL replication lag only
mysql -e 'SHOW SLAVE STATUS \G' | grep Seconds_Behind_Master

# Desc: PostgreSQL replication lag only
cd /tmp && sudo -u postgres psql -d postgres -c "SELECT CASE WHEN pg_last_xlog_receive_location() = pg_last_xlog_replay_location()
    THEN 0
    ELSE EXTRACT (EPOCH FROM now() - pg_last_xact_replay_timestamp())
END AS replication_lag_in_seconds;"
```
<div id='2017-08-14-Validate-archives'/>

## 2017-08-14: Validate archives

Bash snippets to validate the most common archives.

```bash
# Desc: Validate .tar.gz archives
tar -tzf archive.tar.gz >/dev/null

# Desc: Validate .tar archives
tar -tf archive.tar >/dev/null

# Desc: Validate .gz archives
gzip -t archive.gz

# Desc: Validate .bz2 archives
bzip2 -t archive.bz2

# Desc: Validate .zip archives
zip -T archive.zip
```
<div id='2017-08-12-Install-Oracle-Java-8-on-Debian-Stretch'/>

## 2017-08-12: Install Oracle Java 8 on Debian Stretch

```bash
# Desc: Install the network service dirmngr to manage certificate servers
apt install dirmngr

# Desc: Add the repository and the repository key
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# Desc: Update package informations
apt update

# Desc: Install Java
apt install oracle-java8-installer
```
<div id='2017-08-11-Ansible-snippet-to-identify-Vagrantboxes'/>

## 2017-08-11: Ansible snippet to identify Vagrantboxes

```yaml
- name: Check if Server is a Vagrantbox
  shell: 'grep vagrant /etc/passwd | wc -l'
  check_mode: no
  changed_when: false
  register: vagrantbox

- name: Server is a vagrantbox
  debug: msg="Server is a vagrantbox"
  when: vagrantbox.stdout != "0"

- name: Server is not a vagrantbox
  debug: msg="Server is not a vagrantbox"
  when: vagrantbox.stdout == "0"
```
<div id='2017-08-10-Revert-git-commits'/>

## 2017-08-10: Revert git commits

Git snippets to revert commits.

```bash
# Desc: Revert the last commit
git revert HEAD

# Desc: Revert a specific commit by commit id
git revert <commit_id>

# Desc: Revert the last merge
git revert -m1 HEAD

# Desc: Revert a specific merge by commit id
git revert -m1 <commit_id>
```
<div id='2017-08-08-PHP-FPM-not-running-after-vagrant-up-Vagrantbox-by-bento'/>

## 2017-08-08: PHP-FPM not running after vagrant up (Vagrantbox by bento)

The Vagrantboxes from the [bento project](https://github.com/chef/bento) are really good, but the PHP-FPM service didn't start properly during a vagrant up. So I did some research and found a cleanup script (/etc/init.d/mountall-bootclean.sh) which is executed during every startup and removes temporary directories like /var/run where the PHP-FPM socket was placed. Move the socket to a static directory or use the following provisioning command in your Vagrantfile to ensure the PHP-FPM is running after a vagrant up.

```bash
# Desc: Ensure PHP-FPM and Nginx restart after vagrant up
config.vm.provision "shell", inline: "service php7.1-fpm restart && service nginx restart", run: "always"
```
<div id='2017-08-07-HipChat-notifications'/>

## 2017-08-07: HipChat notifications

Bash snippets for HipChat notifications.

```bash
# Desc: HipChat API v2
curl -X POST \
     -H "Content-Type: application/json" \
     --data "{ \"color\":\"green\", \"message\":\"HipCHat API v2\", \"message_format\":\"text\" }" \
     https://api.hipchat.com/v2/room/<room_api_id>/notification?auth_token=<auth_token>

# Desc: HipChat API v1
curl --data "from=Sender&room_id=<room_api_id>&message=%28successful%29+HipChat+API+v1+&message_format=text&color=green" "https://api.hipchat.com/v1/rooms/message?format=json&auth_token=<auth_token>"
```

Further links:

- [Official HipChat Documentation](https://www.hipchat.com/docs/apiv2/method/send_room_notification)
<div id='2017-08-01-Bamboo-workaround-for-empty-directories-in-artifacts'/>

## 2017-08-01: Bamboo workaround for empty directories in artifacts

**Problem:** Bamboo doesn't allow empty directories in artifacts. See [Bamboo issue tracking](https://jira.atlassian.com/browse/BAM-14358).

**Workaround 1 - Logging:** Write empty directories into a file during the build process and re-create them during the deployment process.

Build step:

```bash
# Desc: Find empty directories and write them into a logging file
find . -empty -type d > empty_directories.txt
```

Deployment step:

```bash
# Desc: Create empty directories based on the logging file
cat empty_directories.txt | while read directory; do
    mkdir -p $directory
done
```

**Workaround 2 - Archive:** Create an archive during the build process and extract it during the deployment process.

Build step:

```bash
# Desc: Create tar.gz archive of all files and remove base files
tar czf artifact.tar.gz * --remove-files
```

Deployment step:

```bash
# Desc: Extract archive and remove it
tar xzfv artifact.tar.gz && rm artifact.tar.gz
```
<div id='2017-07-31-Vagrant-Basics'/>

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
<div id='2017-07-20-Syntaxchecks'/>

## 2017-07-20: Syntaxchecks

Bash snippets to check the syntax of other files.

<div id='PHP'/>

### PHP

Syntaxchecks for PHP files.

```bash
# Desc: Syntaxcheck for one file
php -l <file_name>

# Desc: Syntaxcheck for all files in the current directory
find . -name "*.php" -exec php -l {} \;

# Desc: Syntaxcheck for all files in the last Git commit
git diff --name-only --diff-filter=ACMR HEAD~1..HEAD | grep -E "^.*.php$" | xargs -i php -l {}
```

<div id='YAML'/>

### YAML

Syntaxchecks for YAML files.

```bash
# Desc: Syntaxcheck for one file
ruby -e "require 'yaml';puts YAML.load_file('<file_name>')"

# Desc: Syntaxcheck for all files in the current directory
for file in `find . -name "*.yaml"`
do
  ruby -e "require 'yaml';puts YAML.load_file(\"$file\")" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "No syntax errors detected in $file"
  else
    echo "Some syntax errors detected in $file"
  fi
done

# Desc: Syntaxcheck for all files in the last Git commit
for file in `git diff --name-only --diff-filter=ACMR HEAD~1..HEAD | grep -E "^.*.yaml$"`
do
  ruby -e "require 'yaml';puts YAML.load_file(\"$file\")" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "No syntax errors detected in $file"
  else
    echo "Some syntax errors detected in $file"
  fi
done
```
<div id='2017-07-17-Git-user-switcher'/>

## 2017-07-17: Git user switcher

Bash script to switch between git accounts.

```bash
#!/bin/bash
echo "";
echo "1) <name_account1>";
echo "2) <name_account2>";
echo "";

while true; do
    read -p "Which account do you need? " choice
    case $choice in
        [1]* ) git config --global --replace-all user.name "<username_account1>"; git config --global user.email "<usermail_account1>"; break;;
        [2]* ) git config --global --replace-all user.name "<username_account2>"; git config --global user.email "<usermail_account2>"; break;;
        * ) echo "Please answer 1 or 2.";;
    esac
done

mail=`git config --global user.email`;
user=`git config --global user.name`;

echo "";
echo "############ Activated ############";
echo "User: $user";
echo "Mail: $mail";
echo "";
```
<div id='2017-07-16-Command-line-convenience'/>

## 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

<div id='bashrc'/>

### ~/.bashrc

- Prevent inadvertently crontab deletions
- Add execution time to bash history

```bash
function crontab {
    if [[ $* == *"-r"* ]];
    then
        echo "INFO: crontab -r is blocked to prevent inadvertently crontab deletions."
    else
        /usr/bin/crontab $*
    fi
}

HISTTIMEFORMAT="%d.%m.%y %T "
```

<div id='inputrc'/>

### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

<div id='vimrc'/>

### ~/.vimrc

- Color theme
- Line numbers
- Syntax highlighting

```bash
" Color theme for dark backgrounds
:color desert

" Show line numbers
set number

" Enable syntax highlighting
syntax on
```
<div id='2017-07-15-Fix-locale-warnings-on-Linux-servers'/>

## 2017-07-15: Fix locale warnings on Linux servers

**Problem:** Warnings about wrong or missing locale configurations

```bash
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
LANGUAGE = (unset),
LC_ALL = (unset),
LC_PAPER = "de_DE.UTF-8",
LC_ADDRESS = "de_DE.UTF-8",
LC_MONETARY = "de_DE.UTF-8",
LC_NUMERIC = "de_DE.UTF-8",
LC_TELEPHONE = "de_DE.UTF-8",
LC_IDENTIFICATION = "de_DE.UTF-8",
LC_MEASUREMENT = "de_DE.UTF-8",
LC_CTYPE = "en_US.UTF-8",
LC_TIME = "de_DE.UTF-8",
LC_NAME = "de_DE.UTF-8",
LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
```

**Solution 1: dpkg-reconfigure:** Use dpkg-reconfigure to configure LC_ALL

```bash
sudo dpkg-reconfigure locales
```

**Solution 2: /etc/default/locale:** Set LC_ALL in the default local configuration

```bash
sudo su -
echo LC_ALL="en_US.UTF-8" >> /etc/default/locale
```
<div id='2017-07-15-summarizeMD'/>

## 2017-07-15: summarizeMD

summarizeMD is a ruby script to create a table of contents for Markdown files. The short [bash script](https://github.com/neikei/notes/blob/master/tools/createReadme.sh) will merge all Markdown files before the run of [summarizeMD.rb](https://github.com/neikei/notes/blob/master/tools/summarizeMD.rb).

- [Script by velthune](https://github.com/velthune/summarizeMD)
- [Improvements by Kreinoee](https://github.com/Kreinoee/summarizeMD)
<div id='License'/>

# License

This are just a few notes without any warranty. Please check the license [here](https://github.com/neikei/notes/blob/master/LICENSE).

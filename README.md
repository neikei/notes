# Summary 

- [Notes](#section-id-1)
  - [2017-08-08: PHP-FPM not running after vagrant up (Vagrantbox by bento)](#section-id-2)
  - [2017-08-07: HipChat notifications](#section-id-10)
  - [2017-08-01: Bamboo workaround for empty directories in artifacts](#section-id-28)
  - [2017-07-31: Vagrant Basics](#section-id-65)
  - [2017-07-20: Syntaxchecks](#section-id-103)
    - [PHP](#section-id-107)
    - [YAML](#section-id-122)
  - [2017-07-17: Git user switcher](#section-id-152)
  - [2017-07-16: Command line convenience](#section-id-181)
    - [~/.bashrc](#section-id-185)
    - [~/.inputrc](#section-id-200)
    - [~/.vimrc](#section-id-209)
  - [2017-07-15: Fix locale warnings on Linux servers](#section-id-225)
  - [2017-07-15: summarizeMD](#section-id-254)
  

<div id='section-id-1'/>

# Notes
<div id='section-id-2'/>

## 2017-08-08: PHP-FPM not running after vagrant up (Vagrantbox by bento)

The Vagrantboxes from the [bento project](https://github.com/chef/bento) are really good, but the PHP-FPM service didn't start properly during a vagrant up. So I did some research and found a cleanup script (/etc/init.d/mountall-bootclean.sh) which is executed during every startup and removes temporary directories like /var/run where the PHP-FPM socket was placed. Move the socket to a static directory or use the following provisioning command in your Vagrantfile to ensure the PHP-FPM is running after a vagrant up.

```bash
# Desc: Ensure PHP-FPM and Nginx restart after vagrant up
config.vm.provision "shell", inline: "service php7.1-fpm restart && service nginx restart", run: "always"
```
<div id='section-id-10'/>

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
<div id='section-id-28'/>

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
<div id='section-id-65'/>

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
<div id='section-id-103'/>

## 2017-07-20: Syntaxchecks

Bash snippets to check the syntax of other files.

<div id='section-id-107'/>

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

<div id='section-id-122'/>

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
<div id='section-id-152'/>

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
<div id='section-id-181'/>

## 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

<div id='section-id-185'/>

### ~/.bashrc

- Prevent inadvertently crontab deletions

```bash
function crontab {
    if [[ $* == *"-r"* ]];
    then
        echo "INFO: crontab -r is blocked to prevent inadvertently crontab deletions."
    else
        /usr/bin/crontab $*
    fi
}
```

<div id='section-id-200'/>

### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

<div id='section-id-209'/>

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
<div id='section-id-225'/>

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

**Solution:** Reconfiguration of the locales with dpkg

```bash
sudo dpkg-reconfigure locales
```
<div id='section-id-254'/>

## 2017-07-15: summarizeMD

summarizeMD is a ruby script to create a table of contents for Markdown files. The short [bash script](https://github.com/neikei/notes/blob/master/tools/createReadme.sh) will merge all Markdown files before the run of [summarizeMD.rb](https://github.com/neikei/notes/blob/master/tools/summarizeMD.rb).

- [Script by velthune](https://github.com/velthune/summarizeMD)
- [Improvements by Kreinoee](https://github.com/Kreinoee/summarizeMD)

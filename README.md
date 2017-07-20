# Summary 

- [Notes](#section-id-1)
  - [2017-07-20: Syntaxchecks](#section-id-2)
    - [PHP](#section-id-6)
    - [YAML](#section-id-21)
  - [2017-07-17: Git user switcher](#section-id-51)
  - [2017-07-16: Command line convenience](#section-id-80)
    - [~/.bashrc](#section-id-84)
    - [~/.inputrc](#section-id-99)
    - [~/.vimrc](#section-id-108)
  - [2017-07-15: Fix locale warnings on Linux servers](#section-id-124)
  - [2017-07-15: summarizeMD](#section-id-153)
  

<div id='section-id-1'/>

# Notes
<div id='section-id-2'/>

## 2017-07-20: Syntaxchecks

Bash snippets to check the syntax of other files.

<div id='section-id-6'/>

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

<div id='section-id-21'/>

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
<div id='section-id-51'/>

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
<div id='section-id-80'/>

## 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

<div id='section-id-84'/>

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

<div id='section-id-99'/>

### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

<div id='section-id-108'/>

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
<div id='section-id-124'/>

## 2017-07-15: Fix locale warnings on Linux servers

Problem: Warnings about wrong or missing locale configurations

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

Solution: Reconfiguration of the locales with dpkg

```bash
sudo dpkg-reconfigure locales
```
<div id='section-id-153'/>

## 2017-07-15: summarizeMD

summarizeMD is a ruby script to create a table of contents for Markdown files. The short [bash script](https://github.com/neikei/notes/blob/master/tools/createReadme.sh) will merge all Markdown files before the run of [summarizeMD.rb](https://github.com/neikei/notes/blob/master/tools/summarizeMD.rb).

- [Script by velthune](https://github.com/velthune/summarizeMD)
- [Improvements by Kreinoee](https://github.com/Kreinoee/summarizeMD)

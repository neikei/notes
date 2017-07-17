# Summary 

- [Notes](#section-id-1)
  - [2017-07-17: Git user switcher](#section-id-3)
  - [2017-07-16: Command line convenience](#section-id-32)
    - [~/.bashrc](#section-id-36)
    - [~/.inputrc](#section-id-51)
    - [~/.vimrc](#section-id-60)
  - [2017-07-15: Fix locale warnings on Linux servers](#section-id-76)
  - [2017-07-15: summarizeMD](#section-id-105)
  

<div id='section-id-1'/>

# Notes

<div id='section-id-3'/>

## 2017-07-17: Git user switcher

Simple bash script to switch between git accounts.

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
        [2]* ) git config --global --replace-all user.name "<username_account2>"; git config --global user.email "<username_account2>"; break;;
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
<div id='section-id-32'/>

## 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

<div id='section-id-36'/>

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

<div id='section-id-51'/>

### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward
```

<div id='section-id-60'/>

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
<div id='section-id-76'/>

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
<div id='section-id-105'/>

## 2017-07-15: summarizeMD

summarizeMD is a ruby script to create a table of contents for Markdown files. The short [bash script](https://github.com/neikei/notes/blob/master/tools/createReadme.sh) will merge all Markdown files before the run of [summarizeMD.rb](https://github.com/neikei/notes/blob/master/tools/summarizeMD.rb).

- [Script by velthune](https://github.com/velthune/summarizeMD)
- [Improvements by Kreinoee](https://github.com/Kreinoee/summarizeMD)

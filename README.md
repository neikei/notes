# Summary 

- [Notes](#section-id-1)
  - [2017-07-16: Command line convenience](#section-id-3)
    - [~/.bashrc](#section-id-7)
    - [~/.inputrc](#section-id-22)
    - [~/.vimrc](#section-id-32)
  - [2017-07-15: Fix locale warnings on Linux servers](#section-id-48)
  - [2017-07-15: summarizeMD](#section-id-77)
  

<div id='section-id-1'/>

# Notes

<div id='section-id-3'/>

## 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

<div id='section-id-7'/>

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

<div id='section-id-22'/>

### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward

```

<div id='section-id-32'/>

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
<div id='section-id-48'/>

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
<div id='section-id-77'/>

## 2017-07-15: summarizeMD

summarizeMD is a ruby script to create a table of contents for Markdown files. The short [bash script](https://github.com/neikei/notes/blob/master/tools/createReadme.sh) will merge all Markdown files before the run of [summarizeMD.rb](https://github.com/neikei/notes/blob/master/tools/summarizeMD.rb).

- [Script by velthune](https://github.com/velthune/summarizeMD)
- [Improvements by Kreinoee](https://github.com/Kreinoee/summarizeMD)

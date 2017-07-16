## 2017-07-16: Command line convenience

Some useful code snippets to increase the convenience of command line tools.

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

### ~/.inputrc

- Bash history search with page up and down

```bash
"\e[5~": history-search-backward
"\e[6~": history-search-forward

```

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

### 2018-01-15: Lock function

Bash functions to lock and unlock a script to make sure it is only running once. The lockfile is named like the script itself but with the added .lock ending.

```bash
#!/bin/bash

lock() {
    lockFile="${0##*/}.lock"
    if [ ! -f $lockFile ]; then
        `touch $lockFile`;
    else
        echo "==> The script is already running!";
        exit 1;
    fi
}

unlock() {
    lockFile="${0##*/}.lock"
    rm $lockFile
}
```

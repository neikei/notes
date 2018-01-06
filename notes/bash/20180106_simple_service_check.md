### 2018-01-06: Simple service check

Bash snippet to check if a service is up and running. Save the script as check_service.sh and call it with the servicename as parameter.

```bash
#!/bin/bash

if [ -n "$1" ];then
    if pgrep $1 >/dev/null ;then
        echo "$1: up"
    else
        echo "$1: down"
    fi
else
    echo "Error: missing parameter"
    echo "Usage: bash check_service.sh <servicename>"
fi
```

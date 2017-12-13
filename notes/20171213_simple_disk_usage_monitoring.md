## 2017-12-13: Simple disk usage monitoring

Bash snippet to monitor disk usage on non-production systems.

```bash
#!/bin/bash
USED=`df /dev/sda1 | awk '{print $5}' | sed -ne 2p | cut -d"%" -f1`
if [ "$USED" -gt 90 ]; then
    echo "NOT OK: disk usage is above $USED percent."
    # Add some alerting via mail or chat here
else
    echo "OK: $USED disk space used."
fi
```

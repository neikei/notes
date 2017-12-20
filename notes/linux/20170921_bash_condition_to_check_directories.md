### 2017-09-21: Bash condition to check directories

The tilde as indicator for the home directory isn't interpreted right during a bash condition validation.

```bash
#: problematic condition
if [ -d "~/directory" ]; then echo "... is a directory."; fi

#: working condition
if [ -d "$HOME/directory" ]; then echo "... is a directory."; fi
```

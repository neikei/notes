### 2017-10-26: Bamboo branch based configs

Bamboo task for branch based configuration replacements. The following example will only replace the config if the current branch is develop.

```bash
#!/bin/bash

current_branch_name=`git rev-parse --abbrev-ref HEAD`
echo "==> Branch: $current_branch_name"

if [[ $current_branch_name =~ ^develop$ ]]; then

    sed -i "s/placeholder/value/g" app/config/parameters.yml.dist

fi
```

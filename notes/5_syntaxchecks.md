## 2017-07-20: Syntaxchecks

Bash snippets to check the syntax of other files.

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

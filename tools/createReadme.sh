#!/bin/bash

# Hint
echo "# Hint" > README.tmp
echo "" >> README.tmp
echo "Please check the [Github repository](https://github.com/neikei/notes) if a code block isn't displayed properly." >> README.tmp

# Notes
echo "# Notes" >> README.tmp

echo "## Linux" >> README.tmp
for file in `find notes/linux/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done
echo "## Windows" >> README.tmp
for file in `find notes/windows/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done
echo "## Continuous Integration & Continuous Delivery" >> README.tmp
for file in `find notes/ci_cd/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done
echo "## Bash" >> README.tmp
for file in `find notes/bash/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done
echo "## Ansible" >> README.tmp
for file in `find notes/ansible/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done
echo "## Vagrant" >> README.tmp
for file in `find notes/vagrant/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done
echo "## Git" >> README.tmp
for file in `find notes/git/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done

# License
echo "# License" >> README.tmp
echo "" >> README.tmp
echo "This are just a few notes without any warranty. Please check the license [here](https://github.com/neikei/notes/blob/master/LICENSE)." >> README.tmp

# Create summarized Markdown
./tools/summarizeMD.rb -f README.tmp -o README.md

# Cleanup
rm README.tmp
#!/bin/bash

# Hint
echo "# Hint" > README.tmp
echo "" >> README.tmp
echo "Please check the [Github repository](https://github.com/neikei/notes) if a code block isn't displayed properly." >> README.tmp

# Notes
echo "# Notes" >> README.tmp
for file in `find notes/ -name "*.md" | sort -r`
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
#!/bin/bash

# Notes
echo "# Notes" > README.tmp
for file in `find notes/ -name "*.md" | sort -r`
do 
  cat $file >> README.tmp
done

# Create summarized Markdown
./tools/summarizeMD.rb -f README.tmp -o README.md

# Cleanup
rm README.tmp
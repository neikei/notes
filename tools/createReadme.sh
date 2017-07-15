#!/bin/bash

# Headline h1
echo "# Notes" > summarized.md
echo "" >> summarized.md

# Merge all Markdown files
for file in `find . -name "*.md" ! -name "README.md" ! -name "summarized.md" | sort -r`
do 
  cat $file >> summarized.md
done

# Create summarized Markdown
./tools/summarizeMD.rb -f summarized.md -o README.md

# Cleanup
rm summarized.md
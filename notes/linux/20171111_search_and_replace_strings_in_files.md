### 2017-11-11: Search and replace strings in files

Just some basic snippets to search and replace in text files e.g. config files with sed and vim.

**sed**

```bash
#: Search and replace in the whole file
sed -i -e 's/search/replace/g' file.txt
```

**vim**

```bash
#: Open your file with vim
vim file.txt

#: Search and replace only next match after the current cursor position
:s/search/replace/g

#: Search and replace in the whole file
:%s/search/replace/g
```

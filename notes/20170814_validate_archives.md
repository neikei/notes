## 2017-08-14: Validate archives

Bash snippets to validate the most common archives.

```bash
# Desc: Validate .tar.gz archives
tar -tzf archive.tar.gz >/dev/null

# Desc: Validate .tar archives
tar -tf archive.tar >/dev/null

# Desc: Validate .gz archives
gzip -t archive.gz

# Desc: Validate .bz2 archives
bzip2 -t archive.bz2

# Desc: Validate .zip archives
zip -T archive.zip
```

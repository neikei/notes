### 2017-08-14: Validate archives

Bash snippets to validate the most common archives.

```bash
#: Validate .tar.gz archives
tar -tzf archive.tar.gz >/dev/null

#: Validate .tar archives
tar -tf archive.tar >/dev/null

#: Validate .gz archives
gzip -t archive.gz

#: Validate .bz2 archives
bzip2 -t archive.bz2

#: Validate .zip archives
zip -T archive.zip
```

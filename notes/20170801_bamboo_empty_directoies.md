## 2017-08-01: Bamboo workaround for empty directories in artifacts

**Problem:** Bamboo doesn't allow empty directories in artifacts. See [Bamboo issue tracking](https://jira.atlassian.com/browse/BAM-14358).

**Workaround 1 - Logging:** Write empty directories into a file during the build process and re-create them during the deployment process.

Build step:

```bash
# Desc: Find empty directories and write them into a logging file
find . -empty -type d > empty_directories.txt
```

Deployment step:

```bash
# Desc: Create empty directories based on the logging file
cat empty_directories.txt | while read directory; do
    mkdir -p $directory
done
```

**Workaround 2 - Archive:** Create an archive during the build process and extract it during the deployment process.

Build step:

```bash
# Desc: Create tar.gz archive of all files and remove base files
tar czf artifact.tar.gz * --remove-files
```

Deployment step:

```bash
# Desc: Extract archive and remove it
tar xfv artifact.tar.gz && rm artifact.tar.gz
```

### 2017-09-26: Jenkins centralized syntaxchecks

Installation of syntaxchecks for web applications on a Linux Jenkins server.

```bash
# Desc: Install syntaxchecks in the home path of the jenkins application user
su - jenkins
cd ~
git clone https://github.com/neikei/syntaxchecks.git
```

Jenkins task to execute the sytaxchecks during the build process.

```bash
# Desc: Execute syntaxchecks to validate all changed files in the last commit and stop in case of an error
~/syntaxchecks/syntaxchecks.sh -p "`pwd`" -c 1 -s
```

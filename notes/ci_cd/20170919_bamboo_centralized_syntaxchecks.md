### 2017-09-19: Bamboo centralized syntaxchecks

Installation of syntaxchecks for web applications on a Linux Bamboo server.

```bash
#: Install syntaxchecks in the home path of the bamboo application user
su - bamboo
cd ~
git clone https://github.com/neikei/syntaxchecks.git
```

Bamboo task to execute the sytaxchecks during the build process.

```bash
#: Execute syntaxchecks to validate all changed files in the last commit and stop in case of an error
~/syntaxchecks/syntaxchecks.sh -p "${bamboo.build.working.directory}" -c 1 -s
```

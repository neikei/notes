### 2018-03-13: Chocolatey basics

[Chocolatey](https://chocolatey.org/) is a package manager for Windows. The following snippets are just basics for the installation of my required tools and the complete [documentation](https://chocolatey.org/docs) is really useful.

```powershell
#: Start Powershell as administrator

#: Install chocolatey
PS C:\WINDOWS\system32> Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#: Search a package like vagrant and show all available versions
PS C:\WINDOWS\system32> choco search vagrant --all
Chocolatey v0.10.8
...
vagrant 2.0.2 [Approved] Downloads cached for licensed users
vagrant 2.0.1 [Approved] Downloads cached for licensed users
vagrant 2.0.0 [Approved] Downloads cached for licensed users
vagrant 1.9.8 [Approved] Downloads cached for licensed users
vagrant 1.9.7 [Approved]
...
87 packages found.

#: Install a package
PS C:\WINDOWS\system32> choco install vagrant --version 2.0.1 -y

#: Install all required tools at once
PS C:\WINDOWS\system32> choco install keepassx git visualstudiocode sourcetree virtualbox vagrant -y

#: Upgrade all installed packages expect vagrant
PS C:\WINDOWS\system32> choco upgrade all --except="'vagrant'"
```

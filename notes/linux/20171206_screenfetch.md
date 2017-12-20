### 2017-12-06: Screenfetch

[Screenfetch](https://github.com/KittyKatt/screenFetch) is a bash tool to display system information.

```bash
# Desc: Install nfs-kernel-server
neikei@workstation:~$ sudo apt install screenfetch

# Desc: Add the following line to the end of your ~/.bashrc or ~/.zshrc
if [ -f /usr/bin/screenfetch ]; then echo ""; screenfetch; echo ""; fi

# Desc: Example output during shell start

                          ./+o+-       neikei@workstation
                  yyyyy. 'yyyyyy+      OS: Ubuntu 16.04 xenial
              .;//+/////h yyyyyyo      Kernel: x86_64 Linux 4.4.0-67-generic
           .++ .:/++++++/-.`sss/`      Uptime: 5h 41m
         .:++o: `\++++++++/:---:/-     Packages: 2273
        o:+o+:++. `````'-/ooo+++++\    Shell: zsh 5.1.1
       .:+o:+o/.          `+sssooo+\   Resolution: 5760x1200
  .++/+ +oo+o:`             \sssooo;   DE: GNOME
 /+++//+: oo+o               ```````   WM: GNOME Shell
 \+/+o+++ o++o               ydddhh+   WM Theme:
  .++.o+ +oo+:`             /dddhhh;   GTK Theme: Adwaita [GTK2/3]
       .+.o+oo:.           oddhhhh+    Icon Theme: Adwaita
        \+.++o+o` -,,,,.:ohdhhhhh+     Font: Cantarell 11
         `:o+++  ohhhhhhhhyo++os:      Disk: 154G / 242G (68%)
           .o: .syhhhhhhh'.oo++o.      CPU: Intel Core i7-6600U @ 4x 3.4GHz
               /osyyyyyyy.oooo+++\     RAM: 6102MiB / 15464MiB
                   ````` +oo+++o:/
                          `oo++'`

```

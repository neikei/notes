### 2017-07-17: Git user switcher

Bash script to switch between git accounts.

```bash
#!/bin/bash
echo "";
echo "1) <name_account1>";
echo "2) <name_account2>";
echo "";

while true; do
    read -p "Which account do you need? " choice
    case $choice in
        [1]* ) git config --global --replace-all user.name "<username_account1>"; git config --global user.email "<usermail_account1>"; break;;
        [2]* ) git config --global --replace-all user.name "<username_account2>"; git config --global user.email "<usermail_account2>"; break;;
        * ) echo "Please answer 1 or 2.";;
    esac
done

mail=`git config --global user.email`;
user=`git config --global user.name`;

echo "";
echo "############ Activated ############";
echo "User: $user";
echo "Mail: $mail";
echo "";
```

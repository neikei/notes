## 2017-08-11: Ansible snippet to identify Vagrantboxes

```yaml
- name: Check if Server is a Vagrantbox
  shell: 'grep vagrant /etc/passwd | wc -l'
  check_mode: no
  changed_when: false
  register: vagrantbox

- name: Server is a vagrantbox
  debug: msg="Server is a vagrantbox"
  when: vagrantbox.stdout != "0"

- name: Server is not a vagrantbox
  debug: msg="Server is not a vagrantbox"
  when: vagrantbox.stdout == "0"
```

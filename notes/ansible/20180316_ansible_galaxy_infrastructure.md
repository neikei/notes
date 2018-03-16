### 2018-03-16: Ansible Galaxy Infrastructure

[Ansible Galaxy](https://galaxy.ansible.com/) is a hub for ansible roles. I prefer generic Ansible Roles, which can be used on all parts of the infrastructure. This also avoids any misunderstandings between the development environments.

*Infrastructure* overview

```bash
------------        --------------        --------------        ---------------
| role php |        | role nginx |        | role mysql |        | role custom |
------------        --------------        --------------        ---------------
      |                   |                     |                     |
      -----------------------------------------------------------------
                                     |
                            ------------------
                            | Ansible Galaxy |
                            ------------------
                                     |
        -------------------------------------------------------------------
        |                       |                    |                    |
-----------------        ---------------        -----------        --------------
| local dev-box |        | integration |        | staging |        | production |
-----------------        ---------------        -----------        --------------
```

Ansible roles are plugins for your different ansible projects. They are managed in the requirements.yml file and easy to install with ansible-galaxy.

```yaml
#: Installation of roles via ansible-galaxy
ansible-galaxy install -r requirements.yml -p roles/

#: Example of a requirements.yml
- name: php
  src: https://github.com/geerlingguy/ansible-role-php.git
  scm: git
  version: master
```

Thanks to [Jeff Geerling](https://github.com/geerlingguy) for the great ansible roles on Github.

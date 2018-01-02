### 2018-01-02: Load variables based on distribution information

The Ansible Snippet will search in the vars/ folder of a role and loads the variables of the first found file.

```yaml
- name: Load variables based on distributon information
  include_vars: "{{ item }}"
  with_first_found:
    - "{{ ansible_distribution }}-{{ ansible_distribution_version }}.yml"
    - "{{ ansible_distribution }}.yml"
    - "{{ ansible_os_family }}.yml"
    - "default.yml"
```

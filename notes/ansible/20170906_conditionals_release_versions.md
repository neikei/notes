### 2017-09-06: Conditionals for release versions

Ansible tasks examples:

```yaml
- name: "Run only on Debian 8"
  debug:
    msg: "OS: {{ ansible_distribution }} // Version: {{ ansible_distribution_major_version }}"
  when: (ansible_distribution == "Debian" and ansible_distribution_major_version == "8")

- name: "Run on Debian 8 and Debian 9"
  debug:
    msg: "OS: {{ ansible_distribution }} // Version: {{ ansible_distribution_major_version }}"
  when: (ansible_distribution == "Debian" and ansible_distribution_major_version == "8") or
        (ansible_distribution == "Debian" and ansible_distribution_major_version == "9")
```

Jinja2 template examples for the [template module](http://docs.ansible.com/ansible/latest/template_module.html):

```yaml
{% if ansible_distribution_major_version == '8' %}
Debian 8
{% endif %}

{% if ansible_distribution_major_version == '8' or ansible_distribution_major_version == '9' %}
Debian 8 or Debian 9
{% endif %}
```

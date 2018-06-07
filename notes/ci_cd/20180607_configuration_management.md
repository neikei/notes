### 2018-06-07: Configuration management

Configuration management is an exciting topic in computer science. The following graphic gives a small insight into how configuration management can be implemented with
[iTop](https://www.itophub.io/wiki/page) as CMDB, [Ansible](https://www.ansible.com/) for the provisioning and [Check_MK](https://mathias-kettner.com/check_mk.html) for the monitoring. There are further open source projects like [itop-utilities](https://github.com/jaimevalero/itop-utilities) to export the data of the CMDB and transfer
it to Ansible readable data.

*Infrastructure* overview

```bash
                              -----------
                      ------->| Ansible |--------
                     |        -----------        |
-------------        |                           |        ------------------
| iTop CMDB |--------                             ------->| Managed server |
-------------        |                           |        ------------------
                     |        ------------       |
                      ------->| Check_MK |--------
                              ------------
```

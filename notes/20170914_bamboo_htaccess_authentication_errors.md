## 2017-09-14: Bamboo htaccess authentication errors

Bamboo .htaccess restricted authentication will be forwarded to the Tomcat which can cause some authentication errors. It is possible to prevent the forwarding with the following proxy header setting in the Nginx configuration.

```bash
proxy_set_header   Authorization "";
```

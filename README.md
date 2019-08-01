# Smart Proxy - Netbox

This plug-in adds support for ipam in Netbox by acting as a middleman between the forman_netbox plugin and Netbox for IPAM.

### Installing/Usage

To configure this plugin you can use the template from settings.d/netbox.yml.example.
You must place the netbox.yml config file (based on this template) in your 
smart-proxy config/settings.d/ directory with the parameters edited to meet your needs. All parameters are related to Netbox authentication.

The following parameters are required to be set (url, username, and password):

```yaml
# File: settings.d/netbox.yml.example 
---
:enabled: true

:netbox_ipam:
  :netbox:
  #Parameters to edit:
    :url: 'http://netbox.example.com'
    :user: 'admin'
    :password: 'admin'
    :token: '0123456789abcdef0123456789abcdef01234567'
```

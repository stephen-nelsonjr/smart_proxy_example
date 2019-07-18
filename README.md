# Smart Proxy - Netbox

This plug-in adds support for ipam in Netbox by acting as a middleman between the forman_netbox plugin and Netbox for ipam.

### Installing/Usage

To configure this plugin you can use the template from settings.d/netbox.yml.example.
You must place netbox.yml config file (based on this template) to your 
smart-proxy config/settings.d/ directory with the parameters edited to meet your needs.

The following parameters are required to be set:

```yaml
---
# Pulp integration
:enabled: true
:pulp_url: https://url-to-pulp-service.example.com
# Path to Pulp, Pulp content and mongodb directories
:pulp_dir: directory for Pulp on the Pulp node
:pulp_content_dir: where the Pulp content is held
:puppet_content_dir: where the puppet modules are held
:mongodb_dir: the mongodb datadir for Pulp
```

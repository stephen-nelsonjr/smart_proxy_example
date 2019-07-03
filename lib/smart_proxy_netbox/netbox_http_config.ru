require 'smart_proxy_netbox/netbox_api'

map '/netbox' do
  run Proxy::Netbox::Api
end

require 'smart_proxy_netpam/netpam_api'

map '/netpam' do
  run Proxy::Netpam::Api
end

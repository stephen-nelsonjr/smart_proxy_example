require 'sinatra'
require 'netbox-client-ruby'
require 'smart_proxy_netbox/netbox'
require 'smart_proxy_netbox/netbox_main'

module Proxy::Netbox

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers
    
    def configure
      NetboxClientRuby.configure do |c|
        c.netbox.auth.token = ' 0123456789abcdef0123456789abcdef01234567'
        c.netbox.api_base_url = 'http://localhost:8080'
        c.netbox.auth.rsa_private_key.path = '~/.ssh/netbox_rsa'
      end
    end
    
    def assign_new_ip
      # create an ip address
      new_ip = NetboxClientRuby::IPAM::IpAddress.new
      new_ip.address = "192.168.0.3/16"
      new_ip.status = "Active"
      new_ip.description = "Test IP Address"
      new_ip.save    
    end

#     get '/get_new_ipaddress' do
#       content_type :json
      
#       begin 
#         cidr = params[:cidr]
#         ip = params[:ip]
        
#         netbox_client = NetboxClient.new
        
#         if not cidr
#           return {:error => "A 'cidr' parameter for the subnet must be provided(e.g. 100.10.10.0/24)"}.to_json
#         end
        
        
#       end
#     end
  end
end

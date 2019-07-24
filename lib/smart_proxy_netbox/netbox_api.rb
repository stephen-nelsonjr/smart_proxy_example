require 'sinatra'
require 'smart_proxy_netbox/netbox'
require 'smart_proxy_netbox/netbox_main'

module Proxy::Netbox

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers
    
#     def configure
#       NetboxClientRuby.configure do |c|
#         c.netbox.auth.token = ' 0123456789abcdef0123456789abcdef01234567'
#         c.netbox.api_base_url = 'http://localhost:8080'
#         c.netbox.auth.rsa_private_key.path = '~/.ssh/netbox_rsa'
#       end
#     end
    
#     def assign_new_ip
#       # create an ip address
#       new_ip = NetboxClientRuby::IPAM::IpAddress.new
#       new_ip.address = "192.168.0.3/16"
#       new_ip.status = "Active"
#       new_ip.description = "Test IP Address"
#       new_ip.save    
#     end

    # Retrieves the next available IP Address based on a given prefix/subnet
    # Adds the IP Address to Netbox
    get '/get_next_available_ip' do
      content_type :json
      
      begin 
        cidr = params[:cidr]
#         ip = params[:ip]
        
        # Create a net Netbox client object
        netbox_client = NetboxClient.new
        new_ip = netbox_client.add_ip
        
        #check if a 'cidr' is provided
        if not cidr
          return {:error => "A 'cidr' parameter for the subnet must be provided(e.g. 10.10.10.0/24)"}.to_json
        end
        
        {:cidr => cidr, :next_ip => response['data']}.to_json
      end
    end
    
#     get '/get_subnet' do
      
#     end
  end
end

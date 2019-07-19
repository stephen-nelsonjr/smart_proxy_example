require 'yaml'
require 'logger'
require 'json' 
require 'net/http'
require 'smart_proxy_netbox/netbox'
require 'smart_proxy_netbox/netbox_main'

module Proxy::Netbox
  class NetboxClient
    def initialize 
      settings = Proxy::Ipam.get_config[:netbox]
      @netbox_config = {
        :url => settings[:url], 
        :user => settings[:user], 
        :password => settings[:password]
        :token => settings[:token]
      }
#       @api_base = "#{settings[:url]}/api/#{settings[:user]}/"
      @api_base = "#{settings[:url]}/api/"
      
      NetboxClientRuby.configure do |c|
        c.netbox.auth.token = @netbox_config[:url]
        c.netbox.api_base_url = @api_base
        c.netbox.auth.rsa_private_key.path = '~/.ssh/netbox_rsa'
      end
    end
  end
end

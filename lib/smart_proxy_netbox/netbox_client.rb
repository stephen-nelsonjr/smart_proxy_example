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
      @api_base = "#{settings[:url]}/api/#{settings[:user]}/"
      @token = nil
      
      NetboxClientRuby.configure do |c|
        c.netbox.auth.token = '2e35594ec8710e9922d14365a1ea66f27ea69450'
        c.netbox.api_base_url = 'http://netbox.local/api/'
        c.netbox.auth.rsa_private_key.path = '~/.ssh/netbox_rsa'
      end
    end
  end
end

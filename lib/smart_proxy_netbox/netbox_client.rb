require 'yaml'
require 'logger'
require 'json' 
require 'net/http'
require 'smart_proxy_ipam/ipam'
require 'smart_proxy_ipam/ipam_main'

module Proxy::Netbox
  class NetboxClient
    def initialize 
      conf = Proxy::Ipam.get_config[:phpipam]
      @phpipam_config = {
        :url => conf[:url], 
        :user => conf[:user], 
        :password => conf[:password]
      }
      @api_base = "#{conf[:url]}/api/#{conf[:user]}/"
      @token = nil
    end
  end
end

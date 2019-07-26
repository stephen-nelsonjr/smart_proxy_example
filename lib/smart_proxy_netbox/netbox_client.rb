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
    
    def add_subnet
      # create new prefix
      new_prefix = NetboxClientRuby::IPAM::Prefix.new
      new_prefix.prefix = "123.1.0.0/24"
      new_prefix.role = "..."
      new_prefix.description = "..."
      new_prefix.site = "..."
      new_prefix.tags = "..."
    end
    
    def add_ip
      new_ip = NetboxClientRuby::IPAM::IpAddress.new
      new_ip.address = "192.1.0.2/16"
      new_ip.status = "Active"
#       new_ip.role = "..."
      new_ip.description = "Test"
      new_ip.save
    end
    
    def add_vlan_role
      new_role = NetboxClientRuby::IPAM::Role.new
      new_role.name = "..."
      new_role.slug = "..."
      new_role.save
    end
    
    def add_aggregates
      new_agg = NetboxClientRuby::IPAM::Aggregrate.new
      new_agg.prefix = "..." #String
      new_agg.rir = "..." #integer
    end
    
    def add_rir
      new_rir = NetboxClientRuby::IPAM::Rir.new
      new_rir.name = "..." #String
      new_rir.slug = "..." #String
    end
    
    def add_vrf
      new_vrf = NetboxClientRuby::IPAM::Vrf.new
      new_vrf.name = "..." #String
    end
    
    def add
  end
end

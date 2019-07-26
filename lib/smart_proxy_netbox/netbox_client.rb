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
      @api_base_address = "#{settings[:url]}/api/"
      
      NetboxClientRuby.configure do |c|
        c.netbox.auth.token = @netbox_config[:token]
        c.netbox.api_base_url = @api_base_address
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
      new_prefix.save
    end
    
    def add_ip
      new_ip = NetboxClientRuby::IPAM::IpAddress.new
      new_ip.address = "192.1.0.2/16" #String
      new_ip.status = "Active" 
      new_ip.description = "Test" #String
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
      new_agg.save
    end
    
    def add_rir
      new_rir = NetboxClientRuby::IPAM::Rir.new
      new_rir.name = "..." #String
      new_rir.slug = "..." #String
      new_rir.save
    end
    
    def add_vrf
      new_vrf = NetboxClientRuby::IPAM::Vrf.new
      new_vrf.name = "..." #String
      new_vrf.save
    end
    
    def add_vid
      new_vid = NetboxClientRuby::IPAM::Vid.new
      new_vid.vid = "..." #integer
      new_vid.name = "..." #name
      new_vid.save
    end
    
    
  end
end

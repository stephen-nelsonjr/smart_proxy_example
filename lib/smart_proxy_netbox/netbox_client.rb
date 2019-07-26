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
    
    def add_prefix(prefix, description)
      # create new prefix
      new_prefix = NetboxClientRuby::IPAM::Prefix.new
      new_prefix.prefix = "123.1.0.0/24" #String
      new_prefix.description = description #String
      new_prexif.save
#       new_prefix.role = "..."
#       new_prefix.site = "..."
#       new_prefix.tags = "..."
    end
    
    def add_ip(address, description)
      new_ip = NetboxClientRuby::IPAM::IpAddress.new
      new_ip.address = address #"192.1.0.2/16" #String
      new_ip.status = "Active" 
      new_ip.description = description #String
      new_ip.save
    end
    
    def add_vlan_role(name, slug)
      new_role = NetboxClientRuby::IPAM::Role.new
      new_role.name = name #String
      new_role.slug = slug #String 
      new_role.save
    end
    
    def add_aggregate(prefix, rir)
      new_agg = NetboxClientRuby::IPAM::Aggregrate.new
      new_agg.prefix = "..." #String
      new_agg.rir = "..." #integer
      new_agg.save
    end
    
    def add_rir(name, slug)
      new_rir = NetboxClientRuby::IPAM::Rir.new
      new_rir.name = name #String
      new_rir.slug = slug #String
      new_rir.save
    end
    
    def add_vrf(name)
      new_vrf = NetboxClientRuby::IPAM::Vrf.new
      new_vrf.name = name #String
      new_vrf.save
    end
    
    def add_vid(vid, name)
      new_vid = NetboxClientRuby::IPAM::Vid.new
      new_vid.vid = vid #integer
      new_vid.name = name #name
      new_vid.save
    end
    
    def add_vlan_group(name, slug)
      new_vlan_group = NetboxClientRuby::VlanGroup.new
      new_vlan_group.name = name #String
      new_vlan_group.slug = slug #String
      new_vlan_group.save
    end
  end
end

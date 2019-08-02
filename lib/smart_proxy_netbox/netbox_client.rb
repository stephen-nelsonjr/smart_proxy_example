require 'yaml'
require 'logger'
require 'json' 
require 'net/http'
require 'smart_proxy_netbox/netbox'
require 'smart_proxy_netbox/netbox_main'
require 'netbox-client-ruby'
require 'webmock'

module Proxy::Netbox
  class NetboxClient
    include WebMock::API
    
    def initialize 
      @netbox_config = {
        :url => Proxy::SETTINGS.url, 
        :user => Proxy::SETTINGS.user, 
        :password => Proxy::SETTINGS.password,
        :token => Proxy::SETTINGS.token
      }
      @api_base_address = "#{Proxy::SETTINGS.url}" + '/api/'
      
      NetboxClientRuby.configure do |c|
        c.netbox.auth.token = @netbox_config[:token]
        c.netbox.api_base_url = @api_base_address
        c.netbox.auth.rsa_private_key.path = '~/.ssh/netbox_rsa'
      end
      
    end
    
    # For each endpoint, I only included the required parameters
    def get_available_ips(prefix, cidr)
      temp_prefix = NetboxClientRuby::IPAM::Prefix.new
      temp_prefix = prefix + cidr
      temp_prefix.availabe
    end
    
    def add_prefix(prefix, description)
      # Create new Prefix
      new_prefix = NetboxClientRuby::IPAM::Prefix.new
      new_prefix.prefix = "123.1.0.0/24" #String
      new_prefix.description = description #String
      new_prefix.save
#       new_prefix.role = "..."
#       new_prefix.site = "..."
#       new_prefix.tags = "..."
    end
    
    def add_ip(address, description)
      # Create new IP Address
      new_ip = NetboxClientRuby::IPAM::IpAddress.new
      new_ip.address = address #"192.1.0.2/16" #String
      new_ip.status = "Active" 
      new_ip.description = description #String
      new_ip.save
    end
    
    def add_vlan_role(name, slug)
      # Create new VLAN Role
      new_role = NetboxClientRuby::IPAM::Role.new
      new_role.name = name #String
      new_role.slug = slug #String 
      new_role.save
    end
    
    def add_aggregate(prefix, rir)
      # Create new Agggregrate
      new_agg = NetboxClientRuby::IPAM::Aggregrate.new
      new_agg.prefix = prefix #String
      new_agg.rir = rir #integer
      new_agg.save
    end
    
    def add_rir(name, slug)
      # Create new RIR
      new_rir = NetboxClientRuby::IPAM::Rir.new
      new_rir.name = name #String
      new_rir.slug = slug #String
      new_rir.save
    end
    
    def add_vrf(name)
      # Create new VRF
      new_vrf = NetboxClientRuby::IPAM::Vrf.new
      new_vrf.name = name #String
      new_vrf.save
    end
    
    def add_vid(vid, name)
      # Create new VID
      new_vid = NetboxClientRuby::IPAM::Vid.new
      new_vid.vid = vid #integer
      new_vid.name = name #name
      new_vid.save
    end
    
    def add_vlan_group(name, slug)
      # Create new VLAN Group
      new_vlan_group = NetboxClientRuby::VlanGroup.new
      new_vlan_group.name = name #String
      new_vlan_group.slug = slug #String
      new_vlan_group.save
    end
    
    def remove_ip(id)
      # Remove an IP Address with the given ID
      old_ip = NetboxClientRuby.ipam.ip_address(id)
      old_ip.delete
    end
    
    def remove_prefix(id)
      # Remove the Prefix with the given ID
      old_prefix = NetboxClientRuby.ipam.prefix(id)
      old_prefix.delete
    end
  end
end

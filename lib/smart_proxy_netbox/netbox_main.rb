module Proxy::Netbox
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self
    def get_config
      Proxy::Netbox::Plugin.settings.netbox_ipam
    end

  end
end

module Proxy::Netbox
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self
    def get_config
      Proxy::Netbox.settings.netbox_ipam
    end

  end
end

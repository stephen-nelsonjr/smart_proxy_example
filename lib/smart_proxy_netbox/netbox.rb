module Proxy::Example
  class NotFound < RuntimeError; end

  class Plugin < ::Proxy::Plugin
    plugin 'netbox', Proxy::Netbox::VERSION

#     default_settings :hello_greeting => 'O hai!'

    http_rackup_path File.expand_path('netbox_http_config.ru', File.expand_path('../', __FILE__))
    https_rackup_path File.expand_path('netbox_http_config.ru', File.expand_path('../', __FILE__))
  end
end

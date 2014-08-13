module Example
  class Plugin < ::Proxy::Plugin
    plugin 'example', ::Example::VERSION
    default_settings :hello_greeting => 'O hai!'
    http_rackup_path File.expand_path('example_http_config.ru', File.expand_path('../', __FILE__))
    https_rackup_path File.expand_path('example_http_config.ru', File.expand_path('../', __FILE__))
  end
end

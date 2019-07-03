module Proxy::Netbox
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self

    def say_hello
      Proxy::Netbox::Plugin.settings.hello_greeting
    end

  end
end

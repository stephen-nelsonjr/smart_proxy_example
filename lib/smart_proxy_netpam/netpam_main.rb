module Proxy::Netpam
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self

    def say_hello
      Proxy::Netpam::Plugin.settings.hello_greeting
    end

  end
end

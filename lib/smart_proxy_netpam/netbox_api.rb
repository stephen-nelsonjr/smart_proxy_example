require 'sinatra'
require 'smart_proxy_netbox/netbox'
require 'smart_proxy_netbox/netbox_main'

module Proxy::Netbox

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers

    get '/Unused_IP_Address' do
      Proxy::Netbox.say_hello
    end
  end
end

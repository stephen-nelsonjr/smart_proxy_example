require 'sinatra'
require 'smart_proxy_netpam/netpam'
require 'smart_proxy_netpam/netpam_main'

module Proxy::Netpam

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers

    get '/Unused_IP_Address' do
      Proxy::Netpam.say_hello
    end
  end
end

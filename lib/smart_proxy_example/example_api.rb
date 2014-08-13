require 'sinatra'
require 'smart_proxy_example/example'

module Proxy::Example

  class Api < ::Sinatra::Base
    helpers ::Proxy::Helpers

    get '/hello' do
      ::Example::Plugin.settings.hello_greeting
    end
  end
end

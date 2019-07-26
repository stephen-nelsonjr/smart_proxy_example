require 'test_helper'
#require 'webmock/test_unit'
#`require 'mocha/test_unit'
require 'rack/test'
require 'test/unit'

require 'smart_proxy_netbox/netbox'
require 'smart_proxy_netbox/netbox_api'

class NetboxApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::Netbox::Api.new
  end

  def test_returns_hello_greeting
    # add test here
  end
  
  def test_get_next_available_ip
    get '/next_available_ip'
    assert last_response.ok?, "Last response was not ok: #{last_response.body}" 
  end

end

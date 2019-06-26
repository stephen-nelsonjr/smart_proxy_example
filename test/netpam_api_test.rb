require 'test_helper'
require 'webmock/test_unit'
require 'mocha/test_unit'
require 'rack/test'

require 'smart_proxy_netpam/netpam'
require 'smart_proxy_netpam/netpam_api'

class NetpamApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::Netpam::Api.new
  end

  def test_returns_hello_greeting
    # add test here
  end

end

require 'netbox-client-ruby'
NetboxClientRuby.configure do |config|
  config.netbox.auth.token = '0123456789abcdef0123456789abcdef01234567'
  config.netbox.api_base_url = 'http://netbox.local/api/'
end

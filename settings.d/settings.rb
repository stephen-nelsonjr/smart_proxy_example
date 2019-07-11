require 'netbox-client-ruby'

NetboxClientRuby.configure do |config|
  config.netbox.auth.token = '0123456789abcdef0123456789abcdef01234567'
  config.netbox.api_base_url = 'http://netbox.local/api/'
end

# get all sites
sites = NetboxClientRuby.dcim.sites
puts "There are #{sites.total} sites in your Netbox instance."

# get the first site of the result set
first_site = sites.first
puts "The first site is called #{first_site.name}."

# filter devices by site
# Note that Netbox filters by *slug*
devices_of_site = NetboxClientRuby.dcim.devices.filter(site: first_site.slug)
puts "#{devices_of_site.total} devices belong to the site. #{devices_of_site}.length devices have been fetched."

# Finds a specific device
NetboxClientRuby.dcim.devices.find_by(name: 'my-device', other_field: 'other-value')

# Finds a specific device with a certain custom field
NetboxClientRuby.dcim.devices.find_by(cf_custom_url: 'https://google.com')

# Or a mix of regular and custom fields
NetboxClientRuby.dcim.devices.find_by(name: 'my-device', cf_custom_field: 'custom-value')

# get a site by id
s = NetboxClientRuby.dcim.site(1)

# update a site
s.update(name: 'Zurich', slug: 'zrh')

# update a site (alternative)
s.name = 'Amsterdam'
s.slug = 'ams'
s.save

# create a site
new_s = NetboxClientRuby::DCIM::Site.new
new_s.name = 'Berlin'
new_s.slug = 'ber'
new_s.save

# create a site (alternative)
new_s = NetboxClientRuby::DCIM::Site
          .new(name: 'Berlin', slug: 'ber')
          .save

# delete a site
s = NetboxClientRuby.dcim.site(1)
s.delete

# working with secrets
secrets = NetboxClientRuby.secrets.secrets
puts "#{secrets.total} secrets are in your Netbox."
secrets[0].plaintext # => nil, because you have not yet defined a session_key
NetboxClientRuby.secrets.get_session_key # now get a session_key
secrets = NetboxClientRuby.secrets.secrets # you must reload the data from the server
secrets[0].plaintext # => 'super secret password'

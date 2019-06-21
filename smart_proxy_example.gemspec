require File.expand_path('../lib/smart_proxy_example/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'smart_proxy_example'
  s.version = Proxy::Example::VERSION

  s.summary = 'This smart proxy will act as a middleman between the forman plugin and netbox for ipam'
  s.description = 'This smart proxy will act as a middleman between the forman plugin and netbox for ipam'
  s.authors = ['Stephen Nelson jr']
  s.email = 'jrsacmarie@gmail.com'
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.files = Dir['{lib,settings.d,bundler.d}/**/*'] + s.extra_rdoc_files
  s.homepage = 'https://github.com/stephen-nelsonjr/smart_proxy_example'
  s.license = 'GPL-V3'
end

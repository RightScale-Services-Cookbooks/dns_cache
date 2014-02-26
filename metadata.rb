name             'dns_cache'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures dns_cache'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


recipe "dns_cache::default", "installs and sets up dns_cache"

attribute "dns_cache/roots",
  :display_name => "DNS Cache Roots",
  :description => "Array of DNS Roots",
  :required => "optional",
  :type => "array",
  :recipes => [ "dns_cache::default" ]

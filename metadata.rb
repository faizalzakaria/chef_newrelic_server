name             'chef_newrelic_server'
maintainer       'Faizal F Zakaria'
maintainer_email 'phaibusiness@gmail.com'
license          'All rights reserved'
description      'Installs/Configures chef_newrelic_server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w{redhat centos debian ubuntu amazon}.each do |os|
  supports os
end

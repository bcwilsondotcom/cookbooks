name             'sch-collectd'
maintainer       'David F. Severski'
maintainer_email 'davidski@deadheaven.com'
license          'MIT'
description      'Installs/Configures collectd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'collectd', ">= 1.1.0"
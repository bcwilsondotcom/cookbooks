name              'sch-base'
maintainer        'David F. Severski'
maintainer_email  'davidski@deadheaven.com'
license           'MIT'
description       'Common setup for all instances'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1'

depends 'htop', ">= 1.1.0"
depends 'yum-repoforge'

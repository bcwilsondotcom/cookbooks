Cookbooks
=========

Custom Chef cookbooks
+ ES-Curator
+ SCH-Base
+ SCH-CollectD
+ SCH-Elasticsearch
+ SCH-Logstash
+ Security-Monkey

ES-Curator
----------
Set up ElasticSearch index curator. This may no longer be necessary with 
the chef-logstash 0.9.1 release, which incorporates some currator setup.

SCH-Base
--------
Set up common linux configuration (screen and htop).

SCH-CollectD
------------
Wrapper cookbook for CollectD system monitoring.

SCH-Elasticsearch
-----------------
Wrapper cookbook for Elasticsearch.

SCH-Redis-Monitor
-----------------
Install CloudWatch monitor script for redis when used as a logstash buffer.

SCH-Kibana
----------
Wrapper cookbok for Kibana LWRP.

SCH-Logstash
------------
Logstash shipper and indexer configuration.
[sch-logstash::shipper]

[sch-logstash::indexer]

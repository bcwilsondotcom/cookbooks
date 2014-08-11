#!/bin/bash

#Name: monitor.sh
#Purpose: Send #er of events queued in redis to AWS CloudWatch
#Date: 8/11/2014
#Author: David F. Severski

items_buffered=`/usr/local/bin/redis-cli llen logstash`

aws cloudwatch put-metric-data --metric-name RedisItemsQueued --namespace "Logstash" --value $items_buffered --region us-west-2
#!/bin/bash

ISHEALTHY=$(curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"health.health"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/health | jq '.result.healthy')
RESULT=1
if [ $ISHEALTHY = true ]; then
	RESULT=1
else
	RESULT=0
fi
/usr/local/bin/aws cloudwatch put-metric-data --metric-name is-healthy --namespace "AVAPRD01" --value $RESULT --dimensions InstanceId=i-09950435193cfc7b7,InstanceType=t4g.large --unit "Count"

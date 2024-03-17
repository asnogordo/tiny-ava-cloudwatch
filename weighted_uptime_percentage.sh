#!/bin/bash

WEIGHTEDUPTIME=$(curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.uptime"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info |  jq '.result.weightedAveragePercentage')

/usr/local/bin/aws cloudwatch put-metric-data --metric-name weighted-uptime-percentage  --namespace "AVAPRD01" --value $(echo $WEIGHTEDUPTIME | bc) --dimensions InstanceId=i-09950435193cfc7b7,InstanceType=t4g.large --unit "Percent"

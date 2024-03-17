#!/bin/bash

REWARDSTAKE=$(curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.uptime"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info |  jq '.result.rewardingStakePercentage')

/usr/local/bin/aws cloudwatch put-metric-data --metric-name reward-stake-percentage  --namespace "AVAPRD01" --value $(echo $REWARDSTAKE | bc) --dimensions InstanceId=i-09950435193cfc7b7,InstanceType=t4g.large --unit "Percent"

#!/bin/bash
ISNODEAVALIDATOR=$(curl -s -X POST --data '{"jsonrpc": "2.0","method": "platform.getCurrentValidators","params": {},"id": 1}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | grep -c $1)
/usr/local/bin/aws cloudwatch put-metric-data --metric-name is-node-a-validator  --namespace "AVAPRD01" --value $ISNODEAVALIDATOR --dimensions InstanceId=i-09950435193cfc7b7,InstanceType=t4g.large --unit "Count"

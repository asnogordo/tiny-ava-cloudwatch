#!/bin/bash
PEERCOUNT=$(curl -X POST --data '{"jsonrpc":"2.0","id"     :1,"method" :"info.peers"}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info| jq '.result.numPeers | tonumber')
/usr/local/bin/aws cloudwatch put-metric-data --metric-name validator-peer-count  --namespace "AVAPRD01" --value $(expr $PEERCOUNT) --dimensions InstanceId=i-09950435193cfc7b7,InstanceType=t4g.large --unit "Count"

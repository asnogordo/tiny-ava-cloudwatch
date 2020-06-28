#~/bin/bash
ISNODEAVALIDATOR=$(curl -s -X POST --data '{"jsonrpc": "2.0","method": "platform.getCurrentValidators","params": {},"id": 1}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | grep -c $1)
aws cloudwatch put-metric-data --metric-name is-node-a-validator --dimensions Instance=$(curl http://169.254.169.254/latest/meta-data/instance-id)  --namespace "Custom" --value $ISNODEAVALIDATOR

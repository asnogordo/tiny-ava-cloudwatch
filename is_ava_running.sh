#!/bin/bash
AVAPID=$(pgrep avalanchego)
ISALIVE=1
if [ -z "$AVAPID" ]
then
	ISALIVE=0
fi
/usr/local/bin/aws cloudwatch put-metric-data --metric-name is-ava-running --namespace "AVAPRD01" --value $ISALIVE --dimensions InstanceId=i-0f979461e744bfb81,InstanceType=t3a.medium --unit "Count"

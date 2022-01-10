#!/bin/bash
AVAPID=$(pgrep avalanchego)
ISALIVE=1
if [ -z "$AVAPID" ]
then
	ISALIVE=0
fi
/usr/local/bin/aws cloudwatch put-metric-data --metric-name is-ava-running --namespace "AVAPRD01" --value $ISALIVE --dimensions InstanceId=i-08a94b3419950fb4e,InstanceType=m6i.large --unit "Count"

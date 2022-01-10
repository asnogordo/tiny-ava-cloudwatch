#!/bin/bash
GetAvaDbSize=$(df -m /home/ | awk '{ print $3}' | sed 1d)
if [ -z "$GetAvaDbSize" ]
then
	return 1
fi
/usr/local/bin/aws cloudwatch put-metric-data --metric-name AvaDbSize2 --namespace "AVAPRD01" --value $GetAvaDbSize --dimensions InstanceId=i-08a94b3419950fb4e,InstanceType=m6i.large --unit "Megabytes"

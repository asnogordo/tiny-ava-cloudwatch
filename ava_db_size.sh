#!/bin/bash
GetAvaDbSize=$(df -m /home/ | awk '{ print $3}' | sed 1d)
if [ -z "$GetAvaDbSize" ]
then
	return 1
fi
/usr/local/bin/aws cloudwatch put-metric-data --metric-name AvaDbSize --namespace "AVAPRD01" --value $(expr $GetAvaDbSize) --dimensions InstanceId=i-0f979461e744bfb81,InstanceType=t3a.medium --unit "Megabytes"

#!/bin/bash
GetAvaDbSize=$(df -m /opt/avaxdb | awk '{ print $3}' | sed 1d)
if [ -z "$GetAvaDbSize" ]
then
	return 1
fi
/usr/local/bin/aws cloudwatch put-metric-data --metric-name AvaDbSize2 --namespace "AVAPRD01" --value $GetAvaDbSize --dimensions InstanceId=i-09950435193cfc7b7,InstanceType=t4g.large --unit "Megabytes"

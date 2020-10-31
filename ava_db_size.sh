#~/bin/bash
GetAvaDbSize=$(du -mx -d0 /home/ubuntu/.avalanchego/db | awk '{ print $1}')
if [ -z "$GetAvaDbSize" ]
then
	return 1
fi
aws cloudwatch put-metric-data --metric-name AvaDbSize --namespace "AVAPRD01" --unit Megabytes --value $GetAvaDbSize --dimensions InstanceId=i-0f979461e744bfb81,InstanceType=t3a.medium

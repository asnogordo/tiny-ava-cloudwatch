#~/bin/bash
AVAPID=$(pgrep ava)
ISALIVE=1
if [ -z "$AVAPID" ]
then
	ISALIVE=0
fi
aws cloudwatch put-metric-data --metric-name is-ava-running --dimensions Instance=$(curl http://169.254.169.254/latest/meta-data/instance-id)  --namespace "Custom" --value $ISALIVE

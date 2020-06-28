#~/bin/bash
DOTGECKOSIZE=$(du -mx -d0 /home/ubuntu/.gecko/ | awk '{ print $1}')
if [ -z "$DOTGECKOSIZE" ]
then
	return 1
fi
aws cloudwatch put-metric-data --metric-name get-dot-gecko-size-mb --dimensions Instance=$(curl http://169.254.169.254/latest/meta-data/instance-id)  --namespace "Custom" --value $DOTGECKOSIZE

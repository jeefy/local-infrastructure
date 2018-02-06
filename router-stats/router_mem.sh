#!/bin/sh
dir=`dirname $0`
source $dir/env.sh

used_mem=`top -bn1 | head -3 | awk '/Mem/ {print $4}' | sed 's/K//g'`
free_mem=`top -bn1 | head -3 | awk '/Mem/ {print $2}' | sed 's/K//g'`
echo "router_used_mem $used_mem" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_mem
echo "router_free_mem $free_mem" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_mem

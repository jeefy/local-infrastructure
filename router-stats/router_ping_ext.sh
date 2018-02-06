#!/bin/sh
dir=`dirname $0`
source $dir/env.sh

pingdest="www.google.com"
p2=`ping -c1 -W1 $pingdest | grep 'seq=' | sed 's/.*time=\([0-9]*\.[0-9]*\).*$/\1/'`
echo "router_ping_google $p2" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/ping

pingdest="www.reddit.com"
p2=`ping -c1 -W1 $pingdest | grep 'seq=' | sed 's/.*time=\([0-9]*\.[0-9]*\).*$/\1/'`
echo "router_ping_reddit $p2" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/ping

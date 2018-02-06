#!/bin/sh
dir=`dirname $0`
source $dir/env.sh

p1=`wl -i eth1 assoclist | awk '{print $2}' | wc -l`
echo "router_wificlients_24 $p1" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/wifi_clients

p1=`wl -i eth2 assoclist | awk '{print $2}' | wc -l`
echo "router_wificlients_50 $p1" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/wifi_clients

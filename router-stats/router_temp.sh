#!/bin/sh
dir=`dirname $0`
source $dir/env.sh

p1=`wl -i eth1 phy_tempsense | awk '{ print $1 * .5 + 20 }'` # 2.4GHz
p2=`wl -i eth2 phy_tempsense | awk '{ print $1 * .5 + 20 }'` # 5.0GHz

 echo "router_temp_24 $p1" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_temp
 echo "router_temp_50 $p2" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_temp

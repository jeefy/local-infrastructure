#!/bin/sh

# place in /jffs/etc/crontab for dd-wrt
#* * * * * /jffs/metrics/routerstats.sh
#* * * * * (sleep 10; /jffs/metrics/routerstats.sh)
#* * * * * (sleep 20; /jffs/metrics/routerstats.sh)
#* * * * * (sleep 30; /jffs/metrics/routerstats.sh)
#* * * * * (sleep 40; /jffs/metrics/routerstats.sh)
#* * * * * (sleep 50; /jffs/metrics/routerstats.sh)

dir=`dirname $0`

nice -n -19 $dir/router_cpu.sh
sleep 1
nice -n -19 $dir/router_mem.sh
sleep 1
nice -n -19 $dir/router_net.sh
sleep 1
nice -n -19 $dir/router_ping_ext.sh
sleep 1
nice -n -19 $dir/router_temp.sh
sleep 1
nice -n -19 $dir/router_assoclist.sh

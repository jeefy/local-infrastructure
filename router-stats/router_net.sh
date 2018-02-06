#!/bin/sh
dir=`dirname $0`
source $dir/env.sh

maxint=4294967295
dir=`dirname $0`
scriptname=`basename $0`
old="/tmp/$scriptname.data.old"
new="/tmp/$scriptname.data.new"
old_epoch_file="/tmp/$scriptname.epoch.old"

old_epoch=`cat $old_epoch_file`
new_epoch=`date "+%s"`
echo $new_epoch > $old_epoch_file

interval=`expr $new_epoch - $old_epoch` # seconds since last sample

name="router_net"
columns="interface recv_mbps recv_errs recv_drop trans_mbps trans_errs trans_drop"

if [ -f $new ]; then
    awk -v old=$old -v interval=$interval -v maxint=$maxint '{
        getline line < old
        split(line, a)
        if( $1 == a[1] ) {
            recv_bytes  = $2 - a[2]
            trans_bytes = $5 - a[5]
            if(recv_bytes < 0) {recv_bytes = recv_bytes + maxint}    # maxint counter rollover
            if(trans_bytes < 0) {trans_bytes = trans_bytes + maxint} # maxint counter rollover
            recv_mbps  = (8 * (recv_bytes) / interval) / 1048576     # mbits per second
            trans_mbps = (8 * (trans_bytes) / interval) / 1048576    # mbits per second
            print $1, recv_mbps, $3 - a[3], $4 - a[4], trans_mbps, $6 - a[6], $7 - a[7]
        }
    }' $new  | while read line; do
        points="$line"
        #$dir/todb.sh "$name" "$columns" "$points"
        str1=$(echo $points | cut -d' ' -f1)
        str2=$(echo $points | cut -d' ' -f2)
        str3=$(echo $points | cut -d' ' -f3)
        str4=$(echo $points | cut -d' ' -f4)
        str5=$(echo $points | cut -d' ' -f5)
        str6=$(echo $points | cut -d' ' -f6)
        str7=$(echo $points | cut -d' ' -f7)
        echo "router_${str1}_recv_mbps $str2" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/network_traffic
        echo "router_${str1}_recv_errs $str3" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/network_traffic
        echo "router_${str1}_recv_drop $str4" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/network_traffic
        echo "router_${str1}_trans_mbps $str5" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/network_traffic
        echo "router_${str1}_trans_errs $str6" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/network_traffic
        echo "router_${str1}_trans_drop $str7" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/network_traffic
        sleep 1
    done
    mv $new $old
fi

cat /proc/net/dev | tail +3 | tr ':|' '  ' | awk '{print $1,$2,$4,$5,$10,$12,$13}' > $new

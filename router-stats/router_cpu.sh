#!/bin/sh
dir=`dirname $0`
source $dir/env.sh

USR=$(top -bn1 | head -3 | awk '/CPU/ {print $2}' | sed 's/%//g')
SYS=$(top -bn1 | head -3 | awk '/CPU/ {print $4}' | sed 's/%//g')
NIC=$(top -bn1 | head -3 | awk '/CPU/ {print $6}' | sed 's/%//g')
IDLE=$(top -bn1 | head -3 | awk '/CPU/ {print $8}' | sed 's/%//g')
IO=$(top -bn1 | head -3 | awk '/CPU/ {print $10}' | sed 's/%//g')
IRQ=$(top -bn1 | head -3 | awk '/CPU/ {print $12}' | sed 's/%//g')
SIRQ=$(top -bn1 | head -3 | awk '/CPU/ {print $14}' | sed 's/%//g')

echo "router_cpu_usr $USR" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu
echo "router_cpu_sys $SYS" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu
echo "router_cpu_nic $NIC" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu
echo "router_cpu_idle $IDLE" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu
echo "router_cpu_io $IO" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu
echo "router_cpu_irq $IRQ" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu
echo "router_cpu_sirq $SIRQ" | curl --data-binary @- http://$PUSHGATEWAY/metrics/job/router_cpu

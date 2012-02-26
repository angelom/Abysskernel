#!/sbin/busybox sh

# IPv6 privacy tweak
#if /sbin/busybox [ "`/sbin/busybox grep IPV6PRIVACY /system/etc/tweaks.conf`" ]; then
  echo "2" > /proc/sys/net/ipv6/conf/all/use_tempaddr
#fi

# enable SCHED_MC
echo 1 > /sys/devices/system/cpu/sched_mc_power_savings
# Enable AFTR, default:2
echo 3 > /sys/module/cpuidle/parameters/enable_mask

# TCP tweaks
echo "2" > /proc/sys/net/ipv4/tcp_syn_retries
echo "2" > /proc/sys/net/ipv4/tcp_synack_retries
echo "10" > /proc/sys/net/ipv4/tcp_fin_timeout

# Optimize SQlite databases of apps
for i in \
`find /data -iname "*.db"`; 
do \
	/sbin/sqlite3 $i 'VACUUM;';
done;


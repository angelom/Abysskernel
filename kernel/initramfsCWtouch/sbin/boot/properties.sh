#!/sbin/ext/busybox sh
/sbin/ext/busybox mount -o remount,rw rootfs /
mkdir -p /customkernel/property 
echo true >> /customkernel/property/customkernel.cf-root 
echo true >> /customkernel/property/customkernel.base.cf-root 
echo AbyssNote >> /customkernel/property/customkernel.name 
echo "AbyssNote" >> /customkernel/property/customkernel.namedisplay 
echo 100 >> /customkernel/property/customkernel.version.number 
echo 2.6 >> /customkernel/property/customkernel.version.name 
echo true >> /customkernel/property/customkernel.bootani.zip 
echo true >> /customkernel/property/customkernel.bootani.bin 
echo true >> /customkernel/property/customkernel.cwm 
echo 5.0.2.7 >> /customkernel/property/customkernel.cwm.version 
/sbin/ext/busybox mount -o remount,ro rootfs /

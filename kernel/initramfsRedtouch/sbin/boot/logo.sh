#!/sbin/busybox sh
#### install boot logo ####
# import/install custom boot logo if one exists
# sdcard isn't mounted at this point, mount it for now
/sbin/ext/busybox mount -o rw /dev/block/mmcblk0p11 /mnt/sdcard

# import/install custom boot animation if one exists
if [ -f /mnt/sdcard/boot/bootanimation.zip ]; then
  /sbin/ext/busybox mount -o rw,remount /dev/block/mmcblk0p9 /system
  /sbin/ext/busybox rm /system/media/sanim.zip
  /sbin/ext/busybox cp /mnt/sdcard/boot/bootanimation.zip /system/media/bootanimation.zip
  /sbin/ext/busybox rm /mnt/sdcard/boot/bootanimation.zip
  /sbin/ext/busybox mount -o ro,remount /dev/block/mmcblk0p9 /system
fi;

# import/install custom boot sound if one exists
if [ -f /mnt/sdcard/boot/PowerOn.wav ]; then
  /sbin/ext/busybox mount -o rw,remount /dev/block/mmcblk0p9 /system
  /sbin/ext/busybox rm /system/etc/PowerOn.wav
  /sbin/ext/busybox cp /mnt/sdcard/boot/PowerOn.wav /system/etc/PowerOn.wav
  /sbin/ext/busybox rm /mnt/sdcard/boot/PowerOn.wav
  /sbin/ext/busybox mount -o ro,remount /dev/block/mmcblk0p9 /system
fi;

# remove sdcard mount again
/sbin/ext/busybox umount /mnt/sdcard

/sbin/ext/busybox mount rootfs -o remount,rw
/sbin/ext/busybox sh /sbin/boot/modules.sh
/sbin/ext/busybox sh /sbin/boot/properties.sh
/sbin/ext/busybox sh /sbin/boot/backupefs.sh
/sbin/ext/busybox sh /sbin/boot/calibrate.sh
/sbin/ext/busybox sh /sbin/boot/busybox.sh
/sbin/ext/busybox sh /sbin/boot/properties.sh
/sbin/ext/busybox sh /sbin/boot/install.sh
/sbin/ext/busybox sh /sbin/boot/scripts.sh
##### Early-init phase tweaks #####
/sbin/ext/busybox sh /sbin/boot/tweak.sh


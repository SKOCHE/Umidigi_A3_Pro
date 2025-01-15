#!/sbin/sh

relink()
{
	fname=$(basename "$1")
	target="/sbin/$fname"
	sed 's|/system/bin/linker64|///////sbin/linker64|' "$1" > "$target"
	chmod 755 $target
}

venpath="/dev/block/platform/bootdevice/by-name/vendor"
syspath="/dev/block/platform/bootdevice/by-name/system"
mkdir /v
mount -t ext4 -o ro "$venpath" /v
mkdir /s
mount -t ext4 -o ro "$syspath" /s

mkdir /system
mkdir /vendor
cp /s/manifest.xml /system/
cp /s/lib64/libc.so /system/lib64/
cp /s/lib64/libcutils.so /system/lib64/
cp /v/manifest.xml /vendor/
cp /v/compatibility_matrix.xml /vendor/
cp /v/lib64/hw/android.hardware.gatekeeper@1.0-impl.so /vendor/lib64/hw/
cp /v/lib64/hw/android.hardware.keymaster@3.0-impl.so /vendor/lib64/hw/
cp /v/lib64/hw/gatekeeper.mt6763.so /vendor/lib64/hw/
cp /v/lib64/hw/keystore.mt6763.so /vendor/lib64/hw/
cp /v/lib64/hw/kmsetkey.mt6763.so /vendor/lib64/hw/
cp /v/lib64/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-impl.so /vendor/lib64/hw/
cp /v/lib64/libimsg_log.so /vendor/lib64/


relink /v/bin/hw/android.hardware.gatekeeper@1.0-service
relink /v/bin/hw/android.hardware.keymaster@3.0-service
relink /v/bin/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-service
relink /s/bin/hwservicemanager
relink /s/bin/keystore
relink /s/bin/servicemanager

umount /v
umount /s
setprop crypto.ready 1
exit 0

# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=IceCold R6 EAS by PrimoDev23
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=whyred
device.name2=wayne
device.name3=
device.name4=
device.name5=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes
insert_line init.rc "init.icecold.rc" after "import /init.usb.rc" "import /vendor/etc/init/hw/init.icecold.rc";

insert_line /vendor/etc/init/hw/init.qcom.rc "init.icecold.rc" after "import /vendor/etc/init/hw/init.qcom.usb.rc" "import /vendor/etc/init/hw/init.icecold.rc";

# copy script
cp  -f /tmp/anykernel/init/init.icecold.rc /vendor/etc/init/hw/init.icecold.rc
chmod 644 /vendor/etc/init/hw/init.icecold.rc

write_boot;

## end install


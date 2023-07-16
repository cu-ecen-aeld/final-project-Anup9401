#!/bin/sh
# See original version at https://raw.githubusercontent.com/bootlin/training-materials/master/lab-data/buildroot/buildroot-rootfs/S30usbgadget
# This file is referenced in training materials at https://bootlin.com/doc/training/buildroot/buildroot-labs.pdf

# set -e

GADGET_DIR=/config/usb_gadget/g1
OLDPWD=$(pwd)

printf "Starting USB gadget: "

modprobe cppi41
modprobe musb-am335x
modprobe musb-dsps
modprobe phy-am335x
modprobe libcomposite

mkdir /config
mount -t configfs none /config
mkdir ${GADGET_DIR}
cd ${GADGET_DIR}
echo "0x05e8" > idVendor
echo "0xa4a1" > idProduct
mkdir strings/0x409
echo "serialnumber" > strings/0x409/serialnumber
echo "manufacturer" > strings/0x409/manufacturer
echo "ECM Gadget" > strings/0x409/product
mkdir functions/ecm.usb0
mkdir configs/c.1
mkdir configs/c.1/strings/0x409
echo Conf 1 > configs/c.1/strings/0x409/configuration
echo 120 > configs/c.1/MaxPower
echo "06:32:9b:a9:9d:a5" > functions/ecm.usb0/host_addr
ln -s functions/ecm.usb0 configs/c.1
echo musb-hdrc.0 > UDC
cd ${OLDPWD}

echo "OK"

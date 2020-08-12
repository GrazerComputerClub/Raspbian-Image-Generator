#!/bin/bash -e

git clone https://github.com/GrazerComputerClub/Banana-Pi-M2-Zero.git files/Banana-Pi-M2-Zero
cp -v files/Banana-Pi-M2-Zero/kernel/linux-image-*.deb "${ROOTFS_DIR}/home/pi/"
cp -v -r -b files/Banana-Pi-M2-Zero/firmware/* "${ROOTFS_DIR}/lib/firmware/"
cp -v -r files/Banana-Pi-M2-Zero/boot/boot.scr "${ROOTFS_DIR}/boot/"
cp -v -r files/Banana-Pi-M2-Zero/boot/bpi-m2-zero_boot.cmd "${ROOTFS_DIR}/boot/"
rm -rf files/Banana-Pi-M2-Zero

date +"%y.%m-Beta" > ${ROOTFS_DIR}/etc/raspjamming_version

# support only 115200 baudrate : http://0pointer.de/blog/projects/serial-console.html
sed -i -e 's/--keep-baud 115200,38400,9600/--keep-baud 115200/g' ${ROOTFS_DIR}/usr/lib/systemd/system/serial-getty@.service

# change CPU governor from ondemand to conservative to reduce power consumption, keep CPU cooler
sed -i 's/ondemand/conservative/g' ${ROOTFS_DIR}/etc/init.d/raspi-config


#!/bin/bash -e

git clone https://github.com/GrazerComputerClub/Banana-Pi-M2-Zero.git files/Banana-Pi-M2-Zero
cp -v files/Banana-Pi-M2-Zero/kernel/linux-image-*.deb "${ROOTFS_DIR}/home/pi/"
cp -v -r -b files/Banana-Pi-M2-Zero/firmware/* "${ROOTFS_DIR}/lib/firmware/"
cp -v -r files/Banana-Pi-M2-Zero/boot/* "${ROOTFS_DIR}/boot/"
rm -rf files/Banana-Pi-M2-Zero


#!/bin/bash -e

WWW_USER=33
PI_USER=1000

# copy patches
git clone https://github.com/GrazerComputerClub/Banana-Pi-M2-Zero.git files/Banana-Pi-M2-Zero
mv files/Banana-Pi-M2-Zero/patch/*.diff 01-patches
ls 01-patches | grep .diff > 01-patches/series

# revert old changes for avrdude (needed for patch)
cp -fv "${ROOTFS_DIR}/etc/avrdude.conf.orig" "${ROOTFS_DIR}/etc/avrdude.conf"

#install replace bin
cp -fv files/Banana-Pi-M2-Zero/bin/* "${ROOTFS_DIR}/usr/local/bin"


# install GC2 version of gpio librarys
wget https://github.com/GrazerComputerClub/WiringPi/releases/download/2.60.200613/wiringpi-2.60.200613-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/wiringpi-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/0.7.200620-2/python3-rpi.gpio_0.7.200620.buster-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/RPi.GPIO-py3-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/0.7.200620-2/python3-rpi.gpio_0.7.200620.buster-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/RPi.GPIO-py2-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/v0.7.0-buster1/gpiozero.patch -O "${ROOTFS_DIR}/home/pi/gpiozero.patch"

## old bananapi recognition for old librarys
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/var/lib/bananapi/"
install -v -o ${PI_USER} -g ${PI_USER} -m 744 files/board.sh ${ROOTFS_DIR}/var/lib/bananapi/


rm -rf files/Banana-Pi-M2-Zero


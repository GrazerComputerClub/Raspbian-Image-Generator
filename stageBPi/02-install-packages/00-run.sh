#!/bin/bash -e

WWW_USER=33
PI_USER=1000

wget https://github.com/GrazerComputerClub/WiringPi/releases/download/2.60.200613/wiringpi-2.60.200613-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/wiringpi-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/v0.7.0-buster1/python-rpi.gpio_0.7.0.buster-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/RPi.GPIO-py3-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/v0.7.0-buster1/python3-rpi.gpio_0.7.0.buster-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/RPi.GPIO-py2-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/v0.7.0-buster1/gpiozero.patch -O "${ROOTFS_DIR}/home/pi/gpiozero.patch"

wget https://github.com/GrazerComputerClub/Raspjamming-OS_Banana-Pi-M2-Zero/raw/master/patch/avrdude.diff -P 01-patches
cp -f "${ROOTFS_DIR}/etc/avrdude.conf.orig" "${ROOTFS_DIR}/etc/avrdude.conf"

install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/var/lib/bananapi/"
install -v -o ${PI_USER} -g ${PI_USER} -m 744 files/board.sh ${ROOTFS_DIR}/var/lib/bananapi/



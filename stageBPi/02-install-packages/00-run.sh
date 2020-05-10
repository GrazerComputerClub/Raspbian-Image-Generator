#!/bin/bash -e

WWW_USER=33
PI_USER=1000

wget https://github.com/GrazerComputerClub/WiringPi/releases/download/2.60.200413/wiringpi-2.60.200413-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/wiringpi-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/v0.7.0-1/python3-rpi.gpio_0.7.0.buster-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/RPi.GPIO-py3-latest.deb"
wget https://github.com/GrazerComputerClub/RPi.GPIO/releases/download/v0.7.0-1/python-rpi.gpio_0.7.0~buster-1_armhf.deb -O "${ROOTFS_DIR}/home/pi/RPi.GPIO-py2-latest.deb"

install files/board.sh ${ROOTFS_DIR}/var/lib/bananapi/



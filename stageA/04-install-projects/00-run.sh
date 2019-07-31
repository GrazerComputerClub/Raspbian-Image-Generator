#!/bin/bash -e

PI_USER=1000

install -v -o ${PI_USER} -g ${PI_USER} -m 775 -d "${ROOTFS_DIR}/home/pi/Projekte/"

rm -rf files/*
git clone https://github.com/GrazerComputerClub/TM1637Display.git files/TM1637Display
git clone https://github.com/GrazerComputerClub/Sensors-WiringPi.git files/Sensors-WiringPi
wget https://raw.githubusercontent.com/EvilVir/WiringPi.NET/master/Wrapper/WiringPi.cs -P files/
git clone https://github.com/GrazerComputerClub/wiringpi.net.sensors.git files/wiringpi.net.sensors
git clone https://github.com/depklyon/raspberrypi-python-tm1637.git files/raspberrypi-python-tm1637
git clone https://github.com/jdupl/dhtxx-rpi-python3.git files/dhtxx-rpi-python3
cp -rv files/* "${ROOTFS_DIR}/home/pi/Projekte/"
rm -rf files/*

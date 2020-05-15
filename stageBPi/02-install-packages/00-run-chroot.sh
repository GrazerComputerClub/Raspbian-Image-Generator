#!/bin/bash -e

apt-get install /home/pi/wiringpi-latest.deb
apt-get install -y --allow-downgrades /home/pi/RPi.GPIO-py3-latest.deb
apt-get install -y --allow-downgrades /home/pi/RPi.GPIO-py2-latest.deb
apt-mark hold python-rpi.gpio python3-rpi.gpio 
patch /usr/lib/python3/dist-packages/gpiozero/pins/data.py /home/pi/gpiozero.patch
apt-mark hold python3-gpiozero

rm -v /home/pi/wiringpi*.deb /home/pi/RPi.GPIO*.deb /home/pi/gpiozero.patch

# BananaPi not supported 
sudo apt -y remove pigpio libpigpio-dev libpigpio1 libpigpiod-if-dev libpigpiod-if1 libpigpiod-if2-1 pigpio-tools pigpiod



#!/bin/bash -e

pip3 install esptool websockets wiringpi adafruit-circuitpython-am2320 Adafruit_DHT -t /usr/local/lib/python3.5/dist-packages
pip3 install esptool websockets wiringpi adafruit-circuitpython-am2320 Adafruit_DHT -t /usr/local/lib/python3.7/dist-packages
pip install wiringpi -t /usr/local/lib/python2.7/dist-packages/

apt-get install /home/pi/wiringpi-latest.deb
apt-get install /home/pi/liblirc0_0.10.1-5.2_armhf.deb /home/pi/liblirc-client0_0.10.1-5.2_armhf.deb /home/pi/lirc_0.10.1-5.2_armhf.deb
apt-mark hold liblirc0 liblirc-client0 lirc
rm /home/pi/*.deb




#!/bin/bash -e

# install wiringpi
apt-get install /home/pi/wiringpi-latest.deb
apt-mark hold wiringpi

# install RPi.GPIO
apt-get install -y --allow-downgrades /home/pi/RPi.GPIO-py3-latest.deb
apt-get install -y --allow-downgrades /home/pi/RPi.GPIO-py2-latest.deb
## replace RPi.GPIO in /usr/local/lib/python3.7/ too!
rm -r /usr/local/lib/python3.7/dist-packages/RPi/
rm -r /usr/local/lib/python3.7/dist-packages/RPi.GPIO-0.7.*.dist-info
cp -vr /usr/lib/python3/dist-packages/RPi /usr/local/lib/python3.7/dist-packages/
cp -v /usr/lib/python3/dist-packages/RPi.GPIO-0.7.*.egg-info /usr/local/lib/python3.7/dist-packages/
apt-mark hold python-rpi.gpio python3-rpi.gpio

# install gpiozero
#patch /usr/lib/python3/dist-packages/gpiozero/pins/data.py /home/pi/gpiozero.patch
OUT=$(sudo patch -N /usr/lib/python3/dist-packages/gpiozero/pins/data.py /home/pi/gpiozero.patch) || echo "${OUT}" | grep "Skipping patch" -q ||  (echo "$OUT" && false);

apt-mark hold python3-gpiozero

rm -v /home/pi/wiringpi*.deb /home/pi/RPi.GPIO*.deb /home/pi/gpiozero.patch

# BananaPi not supported by pigpio, avoid using
sudo apt -y remove pigpio libpigpio-dev libpigpio1 libpigpiod-if-dev libpigpiod-if1 libpigpiod-if2-1 pigpio-tools pigpiod omxplayer
sudo apt autoremove


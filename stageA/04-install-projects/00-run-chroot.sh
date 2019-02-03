#!/bin/bash -e



#projects
cd "/home/pi/Projekte/"
ls -l
chown pi:pi -R /home/pi/Projekte/
cd raspberrypi-python-tm1637
python3 setup.py install
cd ..
cp dhtxx-rpi-python3/dhtxx.py /usr/local/lib/python3.5/dist-packages/


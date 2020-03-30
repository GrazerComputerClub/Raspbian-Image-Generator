#!/bin/bash -e

apt-get install /home/pi/linux-image-4.19.12-m2z-otg-gadget_1.0-321_armhf.deb

rm /home/pi/linux-image-*.deb

# Debug UART enable
#systemctl enable serial-getty@ttyS2.service






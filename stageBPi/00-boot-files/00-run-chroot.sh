#!/bin/bash -e

apt-get install /home/pi/linux-image-4.19.12-m2z-otg-gadget_1.0-521_armhf.deb
cp /boot/zImage /boot/zImage-4.19.12-m2z-otg-gadget
apt-get install /home/pi/linux-image-4.19.129-sunxi_2.0-100_armhf.deb

rm -v /home/pi/linux-image-*.deb

# Debug UART GPIO enable
systemctl enable serial-getty@ttyS2.service






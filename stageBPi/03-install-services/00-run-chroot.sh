#!/bin/bash -e

# dmxvnc only works with raspberrypi GPU
systemctl disable dmxvnc

# Blockly-gPIo needs root access for gpios with Banana Pi kernel
sed -i 's/^User=.*/User=root/g' /etc/systemd/system/blockly-gpio.service

# Show ip address after boot needs root access for gpios with Banana Pi kernel
sed -i 's/^User=.*/User=root/g' /etc/systemd/system/showip.service

systemctl daemon-reload


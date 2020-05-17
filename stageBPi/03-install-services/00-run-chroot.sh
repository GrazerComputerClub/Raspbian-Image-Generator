#!/bin/bash -e

# dmxvnc only works with raspberrypi GPU
systemctl disable dmxvnc

# Blockly-gPIo needs root to access gpios with Banana Pi kernel 
sed -i 's/^User=.*/User=root/g' /etc/systemd/system/blockly-gpio.service

systemctl daemon-reload


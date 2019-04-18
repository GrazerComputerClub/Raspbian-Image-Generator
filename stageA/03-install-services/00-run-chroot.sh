#!/bin/bash -e

# tiggerhappy: shutdown
chmod u+s /sbin/halt
# tiggerhappy: speaker level control
adduser nobody audio

chown -R 1000:1000 /var/www/html/Blockly-gPIo/

systemctl enable dmxvnc
systemctl enable splashscreen
systemctl enable offscreen
systemctl enable mcp3202
systemctl enable blockly-gpio

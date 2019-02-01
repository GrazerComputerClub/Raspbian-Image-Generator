#!/bin/bash -e

# tiggerhappy: shutdown
chmod u+s /sbin/halt
# tiggerhappy: speaker level control
adduser nobody audio

systemctl enable dmxvnc
systemctl enable splashscreen
systemctl enable offscreen
systemctl enable mcp3202
systemctl enable blockly-gpio

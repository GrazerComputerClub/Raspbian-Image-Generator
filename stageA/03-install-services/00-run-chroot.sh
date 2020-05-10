#!/bin/bash -e

WWW_USER=33

# tiggerhappy: shutdown
chmod u+s /sbin/halt
# tiggerhappy: speaker level control
adduser nobody audio

chown -R ${WWW_USER}:${WWW_USER} /var/www/
#chown -R ${WWW_USER}:${WWW_USER} /var/www/html/Blockly-gPIo/
chown -R ${WWW_USER}:${WWW_USER} /var/cache/lighttpd/compress/

systemctl enable dmxvnc
systemctl enable splashscreen
systemctl enable offscreen
#systemctl enable mcp3202
systemctl enable blockly-gpio

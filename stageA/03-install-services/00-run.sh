#!/bin/bash -e

## Blockly-gPIo
# pi user/group id is 1000
BLOCKLY_USER=1000
WWW_USER=33
PI_USER=1000
rm -rf files/git
git clone https://github.com/GrazerComputerClub/Blockly-gPIo.git files/git
install -v -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 775 -d "${ROOTFS_DIR}/opt/Blockly-gPIo/"
install -v -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 664 files/git/*.py "${ROOTFS_DIR}/opt/Blockly-gPIo/"
install -v -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 644 files/git/LICENSE "${ROOTFS_DIR}/opt/Blockly-gPIo/"
install -v -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 775 -d "${ROOTFS_DIR}/opt/Blockly-gPIo/server"
install -v -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 664 files/git/server/*.py "${ROOTFS_DIR}/opt/Blockly-gPIo/server/"
# Blockly Website 
install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 -d "${ROOTFS_DIR}/var/www/html/Blockly-gPIo/"
cp -r files/git/public/* "${ROOTFS_DIR}/var/www/html/Blockly-gPIo"
install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 -d "${ROOTFS_DIR}/var/www/html/Blockly-gPIo-examples/"
install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 -d "${ROOTFS_DIR}/var/www/html/Blockly-gPIo-examples/Deutsch/"
install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 -d "${ROOTFS_DIR}/var/www/html/Blockly-gPIo-examples/English/"
#cp -v files/git/examples/*.xml "${ROOTFS_DIR}/var/www/html/Blockly-gPIo-examples/"
cp -v files/git/examples/Deutsch/*.xml "${ROOTFS_DIR}/var/www/html/Blockly-gPIo-examples/Deutsch"
cp -v files/git/examples/English/*.xml "${ROOTFS_DIR}/var/www/html/Blockly-gPIo-examples/English"
unzip files/lighttpd_cache.zip -d "${ROOTFS_DIR}/var/cache/lighttpd/compress/"

## Raspjamming-Image installation
rm -rf files/git
git clone https://github.com/GrazerComputerClub/Raspjamming-Image/ files/git
install -v -m 755 -d "${ROOTFS_DIR}/usr/share/png/"
install -v -m 664 files/git/png/* "${ROOTFS_DIR}/usr/share/png/"
# no etc/* because of append rc.local!
install -v -m 755 files/git/etc/*.sh "${ROOTFS_DIR}/etc/"
cat files/append_profile >> ${ROOTFS_DIR}/home/pi/.profile
sed -i -e 's/^exit 0/ /g' ${ROOTFS_DIR}/etc/rc.local
cat files/append_rc.local >> ${ROOTFS_DIR}/etc/rc.local
echo -e "\n\nexit 0" >> ${ROOTFS_DIR}/etc/rc.local
install -v -m 664 files/git/etc/triggerhappy/* "${ROOTFS_DIR}/etc/triggerhappy/triggers.d/"
install -v -m 775 files/git/bin/* "${ROOTFS_DIR}/usr/local/bin/"
install -v -m 664 files/git/systemd/*.service "${ROOTFS_DIR}/etc/systemd/system/"
install -v -o ${PI_USER} -g ${PI_USER} -m 775 -d "${ROOTFS_DIR}/home/pi/scripts/"
install -v -o ${PI_USER} -g ${PI_USER} -m 775 files/git/scripts/* "${ROOTFS_DIR}/home/pi/scripts/"
install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 -d "${ROOTFS_DIR}/var/www/html/scripts/"
install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 files/git/scripts/* "${ROOTFS_DIR}/var/www/html/scripts/"
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/home/pi/.picodrive"
install -v -o ${PI_USER} -g ${PI_USER} -m 775 files/git/home/.picodrive/* "${ROOTFS_DIR}/home/pi/.picodrive"


#deactivated - because of manual start fbcp via pico8 start script
#install -m 664 files/udev/*.rules "${ROOTFS_DIR}/etc/udev/rules.d/"
file="${ROOTFS_DIR}/var/www/html/index.html"
[ -f $file ] && rm $file 
cp -rv files/git/www/* "${ROOTFS_DIR}/var/www/html"
#install -v -o ${WWW_USER} -g ${WWW_USER} -m 775 -d "${ROOTFS_DIR}/var/www/html/PDF"
wget -P "${ROOTFS_DIR}/var/www/html/PDF" https://github.com/GrazerComputerClub/Raspjamming/releases/latest/download/Raspjamming.pdf
rm -rf files/git

rm -rf files/pico8-carts
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/home/pi/.lexaloffle/pico-8/carts"
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/home/pi/.lexaloffle/pico-8/bbs"
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/home/pi/.lexaloffle/pico-8/bbs/carts"
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/home/pi/.lexaloffle/pico-8/bbs/labels"
wget https://raw.githubusercontent.com/mstroh76/pico8/master/carts/youare.p8.png -P files/pico8-carts
# https://github.com/DanielOaks/ pico-8 sample cc0
wget https://github.com/DanielOaks/pico-8/raw/master/demo_effects/scrolling_stars.p8 -P files/pico8-carts
wget https://github.com/DanielOaks/pico-8/raw/master/demo_effects/3d_cube.p8 -P files/pico8-carts
wget https://github.com/DanielOaks/pico-8/raw/master/demo_effects/music_sync.p8 -P files/pico8-carts
install -v -o ${PI_USER} -g ${PI_USER} -m 664 files/pico8-carts/*.p8* "${ROOTFS_DIR}/home/pi/.lexaloffle/pico-8/carts"
rm -rf files/pico8-carts

## GC2-xHAT
## eeprom-settings
wget https://raw.githubusercontent.com/GrazerComputerClub/GC2-xHAT/master/EEPROM/eeprom_settings.txt -O files/GC2-xHAT_eeprom_settings.txt 
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/GC2-xHAT_eeprom_settings.txt "${ROOTFS_DIR}/usr/local/bin/"
rm files/GC2-xHAT_eeprom_settings.txt
## aliases
wget https://github.com/GrazerComputerClub/GC2-xHAT/raw/master/aliases/bash_aliases_GC2xHAT -O files/.bash_aliases_GC2xHAT 
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/.bash_aliases* "${ROOTFS_DIR}/home/pi/"
rm files/.bash_aliases_GC2xHAT 
patch -N ${ROOTFS_DIR}/home/pi/.bashrc files/bashrc.patch


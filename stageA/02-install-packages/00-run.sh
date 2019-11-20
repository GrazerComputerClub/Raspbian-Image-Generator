#!/bin/bash -e

WWW_USER=33
PI_USER=1000

date +"%y.%m" > ${ROOTFS_DIR}/etc/raspjamming_version
patch -N ${ROOTFS_DIR}/etc/avrdude.conf files/avrdude.patch
#patch -N ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf files/lighttpd.patch
cat files/lighttpd.append >> ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf
install -v -o ${WWW_USER} -g ${WWW_USER} -m 664 files/lighttpd-dir.css "${ROOTFS_DIR}/var/www/html/"

wget -P "files" https://github.com/espressif/ESP8266_NONOS_SDK/archive/v2.2.1.zip
unzip files/v2.2.1.zip -d ${ROOTFS_DIR}/opt/
rm files/v2.2.1.zip

cp files/*.deb "${ROOTFS_DIR}/home/pi"


#install -v -o ${PI_USER} -g ${PI_USER} -m 755 files/geany-gtk2 "${ROOTFS_DIR}/usr/bin/"
tar xzvf files/geany-gtk2.tar.gz -C "${ROOTFS_DIR}/usr/bin/"
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/geany-gtk2/"
tar xzvf files/geany-gtk2-lib.tar.gz -C "${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/geany-gtk2/"
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/geany.gtkrc "${ROOTFS_DIR}/usr/share/geany/"

install -v -o ${PI_USER} -g ${PI_USER} -m 700 -d "${ROOTFS_DIR}/home/pi/.config/"
install -v -o ${PI_USER} -g ${PI_USER} -m 700 -d "${ROOTFS_DIR}/home/pi/.config/geany"
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/keybindings.conf "${ROOTFS_DIR}/home/pi/.config/geany/"
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/geany.conf "${ROOTFS_DIR}/home/pi/.config/geany/"

rm -rf files/bcmstat
git clone https://github.com/MilhouseVH/bcmstat.git files/bcmstat
install -v -o ${PI_USER} -g ${PI_USER} -m 775 files/bcmstat/bcmstat.sh "${ROOTFS_DIR}/usr/local/bin/"
install -v -o ${PI_USER} -g ${PI_USER} -m 444 files/bcmstat/LICENSE "${ROOTFS_DIR}/usr/local/bin/bcmstat.LICENSE"
rm -rf files/bcmstat


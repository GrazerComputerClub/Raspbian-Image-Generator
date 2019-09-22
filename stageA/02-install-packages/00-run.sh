#!/bin/bash -e

WWW_USER=33

date +"%y.%m" > ${ROOTFS_DIR}/etc/raspjamming_version
patch -N ${ROOTFS_DIR}/etc/avrdude.conf files/avrdude.patch
#patch -N ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf files/lighttpd.patch
cat files/lighttpd.append >> ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf
install -v -o ${WWW_USER} -g ${WWW_USER} -m 664 files/lighttpd-dir.css "${ROOTFS_DIR}/var/www/html/"

wget -P "files" https://github.com/espressif/ESP8266_NONOS_SDK/archive/v2.2.1.zip
unzip files/v2.2.1.zip -d ${ROOTFS_DIR}/opt/
rm files/v2.2.1.zip

cp files/*.deb "${ROOTFS_DIR}/home/pi"

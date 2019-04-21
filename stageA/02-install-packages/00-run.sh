#!/bin/bash -e

WWW_USER=33

patch -N ${ROOTFS_DIR}/etc/avrdude.conf files/avrdude.patch
patch -N ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf files/lighttpd.patch
install -v -o ${WWW_USER} -g ${WWW_USER} -m 664 files/lighttpd-dir.css "${ROOTFS_DIR}/var/www/html/"

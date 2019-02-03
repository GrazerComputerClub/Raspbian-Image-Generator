#!/bin/bash -e

rm -rf files/git
git clone https://github.com/GrazerComputerClub/rpi-boot files/git
install -m 644 files/git/*.txt ${ROOTFS_DIR}/boot/
install -m 644 files/git/overlays/*.dtbo ${ROOTFS_DIR}/boot/overlays/
perl -i -p -e 's/\n/ /' ${ROOTFS_DIR}/boot/cmdline.txt
cat files/append_cmdline.txt >> ${ROOTFS_DIR}/boot/cmdline.txt
cat files/append_config.txt >> ${ROOTFS_DIR}/boot/config.txt
cat files/append_dhcpcd.conf >> ${ROOTFS_DIR}/etc/dhcpcd.conf
cat files/append_dhcpd.conf >> ${ROOTFS_DIR}/etc/dhcp/dhcpd.conf
rm -rf files/git

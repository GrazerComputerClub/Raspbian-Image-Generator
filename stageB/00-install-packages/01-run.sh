#!/bin/bash -e

on_chroot << EOF
update-alternatives --install /usr/bin/x-www-browser \
  x-www-browser /usr/bin/chromium-browser 86
update-alternatives --install /usr/bin/gnome-www-browser \
  gnome-www-browser /usr/bin/chromium-browser 86
EOF

cp files/GC2_Logo.png ${ROOTFS_DIR}/usr/share/lxde/images/GC2.png
cp -rvf files/config/* ${ROOTFS_DIR}/home/pi/.config/

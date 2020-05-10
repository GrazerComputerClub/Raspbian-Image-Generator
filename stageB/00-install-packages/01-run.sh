#!/bin/bash -e

PI_USER=1000

on_chroot << EOF
update-alternatives --install /usr/bin/x-www-browser \
  x-www-browser /usr/bin/chromium-browser 86
update-alternatives --install /usr/bin/gnome-www-browser \
  gnome-www-browser /usr/bin/chromium-browser 86
EOF

cp files/GC2_Logo.png ${ROOTFS_DIR}/usr/share/lxde/images/GC2.png
cp -rvf files/config/* ${ROOTFS_DIR}/home/pi/.config/

cp -v files/menu/gc2-menu.menu ${ROOTFS_DIR}/var/lib/menu-xdg/menus/
ln -s ${ROOTFS_DIR}/var/lib/menu-xdg/menus/gc2-menu.menu ${ROOTFS_DIR}/etc/xdg/menus/gc2-menu.menu
cp -v files/menu/*.desktop ${ROOTFS_DIR}/var/lib/menu-xdg/applications/menu-xdg/

install -v -o ${PI_USER} -g ${PI_USER} files/.conkyrc "${ROOTFS_DIR}/home/pi/"


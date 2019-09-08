#!/bin/bash -e

KITTEN_USER=1001
KITTEN_GROUP=1004

rm -rf files/git
git clone https://github.com/GrazerComputerClub/Circlean files/git

#sudo rsync -vri Circlean/circlean_fs/boot/ /boot/
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 -d "${ROOTFS_DIR}/opt/groomer/"
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 files/git/circlean_fs/root_partition/opt/groomer/* "${ROOTFS_DIR}/opt/groomer/"
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 files/git/circlean_fs/root_partition/usr/local/bin/* "${ROOTFS_DIR}/usr/local/bin"
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 -d "${ROOTFS_DIR}/opt/midi/"
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 -d "${ROOTFS_DIR}/opt/midi/classic"
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 664 files/git/midi/classic/*.mid "${ROOTFS_DIR}/opt/midi/classic"
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 664 files/git/midi/classic/*license* "${ROOTFS_DIR}/opt/midi/classic"

install -v -m 775 files/git/circlean_fs/root_partition/etc/udev/rules.d/* "${ROOTFS_DIR}/etc/udev/rules.d"
install -v -m 664 files/git/circlean_fs/root_partition/etc/pmount.allow "${ROOTFS_DIR}/etc/"
install -v -m 664 files/git/circlean_fs/root_partition/etc/triggerhappy/triggers.d/* "${ROOTFS_DIR}/etc/triggerhappy/triggers.d/"
install -v -m 664 files/git/circlean_fs/root_partition/etc/systemd/system/groomer.service "${ROOTFS_DIR}/etc/systemd/system/"

install -v -m 664 files/git/circlean_fs/boot/config*.txt "${ROOTFS_DIR}/boot"
install -v -m 664 files/git/circlean_fs/boot/overlays/*.dtbo "${ROOTFS_DIR}/boot/overlays"

install -v -m 664 files/usb-led.system "${ROOTFS_DIR}/etc/systemd/system"

rm -rf files/git



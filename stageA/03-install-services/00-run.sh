#!/bin/bash -e

# pi user/group id is 1000
BLOCKLY_USER=1000
rm -rf files/git
git clone https://github.com/GrazerComputerClub/Blockly-gPIo.git files/git
install -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 775 -d "${ROOTFS_DIR}/opt/Blockly-gPIo/"
install -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 775 -d "${ROOTFS_DIR}/opt/Blockly-gPIo/server"
install -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 664 files/git/server/* "${ROOTFS_DIR}/opt/Blockly-gPIo/server/"
install -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 664 files/git/run.py "${ROOTFS_DIR}/opt/Blockly-gPIo/"
install -o ${BLOCKLY_USER} -g ${BLOCKLY_USER} -m 644 files/git/LICENSE "${ROOTFS_DIR}/opt/Blockly-gPIo/"
rm -rf files/git
git clone https://github.com/GrazerComputerClub/Raspjamming-Image/ files/git
install -m 755 -d "${ROOTFS_DIR}/usr/share/png/"
install -m 664 files/git/png/* "${ROOTFS_DIR}/usr/share/png/"
# no etc/* because of append rc.local!
install -m 755 files/git/etc/*.sh "${ROOTFS_DIR}/etc/"
echo "sh /etc/motd.sh" >> ${ROOTFS_DIR}/home/pi/.profile
sed -i -e 's/^exit 0/ /g' ${ROOTFS_DIR}/etc/rc.local
cat files/append_rc.local >> ${ROOTFS_DIR}/etc/rc.local
echo -e "\n\nexit 0" >> ${ROOTFS_DIR}/etc/rc.local
install -m 664 files/git/etc/triggerhappy/* "${ROOTFS_DIR}/etc/triggerhappy/triggers.d/"
install -m 775 files/git/bin/* "${ROOTFS_DIR}/usr/local/bin/"
install -m 664 files/git/systemd/*.service "${ROOTFS_DIR}/etc/systemd/system/"
#deactivated - because of manual start fbcp via pico8 start script
#install -m 664 files/udev/*.rules "${ROOTFS_DIR}/etc/udev/rules.d/"
rm -rf files/git



#!/bin/bash -e

echo -e "\ninclude configUSBSanitizer.txt\n" >> ${ROOTFS_DIR}/boot/config.txt
#recommended system settings
echo -e "\ninclude configSystem.txt" >> ${ROOTFS_DIR}/boot/config.txt
echo -n "sanitizer" > ${ROOTFS_DIR}/etc/hostname
sed -i -e 's/raspberrypi/sanitizer/g' ${ROOTFS_DIR}/etc/hosts

sed -i -e 's/nobody/root/g' ${ROOTFS_DIR}/lib/systemd/system/triggerhappy.service
sed -i -e 's/nobody/root/g' ${ROOTFS_DIR}/etc/init.d/triggerhappy
#sudo sed -i -e 's/nobody/root/g' ${ROOTFS_DIR}/etc/systemd/system/triggerhappy.service 
#sudo sed -i -e 's/nobody/root/g' ${ROOTFS_DIR}/etc/systemd/system/multi-user.target.wants/triggerhappy.service 


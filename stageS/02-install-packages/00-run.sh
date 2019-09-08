#!/bin/bash -e

KITTEN_USER=1001
KITTEN_GROUP=1004

cp files/p7zip-rar_16.02-3_armhf.deb ${ROOTFS_DIR}/home/pi

rm -f files/pdfid.zip
rm -rf files/pdfid/
wget http://didierstevens.com/files/software/pdfid_v0_2_5.zip -O files/pdfid.zip
unzip files/pdfid.zip -d files/pdfid
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 files/pdfid/* "${ROOTFS_DIR}/usr/local/bin/"
rm -f files/pdfid.zip
rm -rf files/pdfid/

rm -f files/filecheck.py
wget https://github.com/CIRCL/PyCIRCLean/raw/master/filecheck/filecheck.py -P files/
install -v -o ${KITTEN_USER} -g ${KITTEN_GROUP} -m 775 files/filecheck.py "${ROOTFS_DIR}/usr/local/bin/"
rm -f files/filecheck.py

# needed for USB activity LED 
cat files/append_modules >> ${ROOTFS_DIR}/etc/modules



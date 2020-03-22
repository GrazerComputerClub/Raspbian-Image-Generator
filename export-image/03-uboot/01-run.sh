#!/bin/bash -e
IMG_FILE="${STAGE_WORK_DIR}/${IMG_FILENAME}${IMG_SUFFIX}.img"

rm -rf files/bootloader_uboot.bin
wget https://github.com/GrazerComputerClub/Banana-Pi-M2-Zero/raw/master/boot/bootloader_uboot.bin -P files
echo installing uboot bootlader to "$IMG_FILE"
dd if=files/bootloader_uboot.bin conv=notrunc bs=1k seek=8 of="$IMG_FILE"



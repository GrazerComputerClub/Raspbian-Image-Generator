#!/bin/bash -e

install -m 644 files/keyboard "${ROOTFS_DIR}/etc/default/"
install -m 644 files/zramswap "${ROOTFS_DIR}/etc/default/"

date +"%y.%m" > ${ROOTFS_DIR}/etc/raspjamming_version

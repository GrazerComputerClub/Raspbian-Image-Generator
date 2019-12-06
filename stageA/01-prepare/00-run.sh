#!/bin/bash -e

install -m 644 files/keyboard "${ROOTFS_DIR}/etc/default/"
install -m 644 files/zramswap "${ROOTFS_DIR}/etc/default/"

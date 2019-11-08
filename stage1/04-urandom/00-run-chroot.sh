#!/bin/bash -e

ls -l /dev/*rand*
head -n 1 /dev/urandom
#openssl genrsa -out /filetest 1024
#mknod -m 0644 /dev/random c 1 8
#mknod -m 0644 /dev/urandom c 1 9




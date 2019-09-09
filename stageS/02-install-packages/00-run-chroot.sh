#!/bin/bash -e

KITTEN_USER=1001
KITTEN_GROUP=1004

#sudo -i
#sed -i '/deb-src/s/^#//' /etc/apt/sources.list 
#apt-get update 
#cd ~
#mkdir rar && cd rar/
#apt-get build-dep p7zip-rar
#apt-get source -b p7zip-rar
#sed -i '/deb-src/s/^/# /' /etc/apt/sources.list
#dpkg -i p7zip-rar_*.deb
#cd ..
#rm -r rar
apt-get install /home/pi/p7zip-rar_16.02-3_armhf.deb
apt-get install /home/pi/wiringpi-latest.deb
rm /home/pi/*.deb

#https://github.com/CIRCL/PyCIRCLean/blob/master/Makefile
pip3 install olefile oletools exifread pillow -t /usr/local/lib/python3.7/dist-packages
pip3 install git+https://github.com/Rafiot/officedissector.git -t /usr/local/lib/python3.7/dist-packages
pip3 install git+https://github.com/CIRCL/PyCIRCLean.git -t /usr/local/lib/python3.7/dist-packages

if [ $(getent group kitten) ]; then
  echo "kitten group already exists."
else
  addgroup --gid ${KITTEN_GROUP} kitten
  useradd -u ${KITTEN_USER} -g ${KITTEN_GROUP} -m kitten
  adduser kitten plugdev
fi




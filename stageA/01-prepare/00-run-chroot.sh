#!/bin/bash -e

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-raspbianbuster main" | tee /etc/apt/sources.list.d/mono-official-stable.list

wget -qO - http://debian.fhem.de/archive.key | apt-key add -
echo "deb http://debian.fhem.de/nightly/ /" | sudo tee /etc/apt/sources.list.d/fhem.list

apt update

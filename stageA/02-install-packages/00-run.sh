#!/bin/bash -e

WWW_USER=33
PI_USER=1000

#patch -N ${ROOTFS_DIR}/etc/avrdude.conf files/avrdude.patch
OUT=$(sudo patch -N ${ROOTFS_DIR}/etc/avrdude.conf files/avrdude.patch) || echo "${OUT}" | grep "Skipping patch" -q ||  (echo "$OUT" && false);


#patch -N ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf files/lighttpd.patch
cat files/lighttpd.append >> ${ROOTFS_DIR}/etc/lighttpd/lighttpd.conf
install -v -o ${WWW_USER} -g ${WWW_USER} -m 664 files/lighttpd-dir.css "${ROOTFS_DIR}/var/www/html/"

wget -P "files" https://github.com/espressif/ESP8266_NONOS_SDK/archive/v2.2.1.zip
unzip files/v2.2.1.zip -d ${ROOTFS_DIR}/opt/
rm files/v2.2.1.zip

if [ `uname -m` = "armv7l" ];  then
  #replace C# Mono librarys with Pi Zero compatible ones (fix error for build system with ARMv7 CPU)
  tar xzvf files/mono_pi0.tar.gz -C "${ROOTFS_DIR}/usr/lib/mono/aot-cache/arm"
fi

cp files/*.deb "${ROOTFS_DIR}/home/pi"

install -v -m 755 -d "${ROOTFS_DIR}/usr/share/fonts/truetype/sourcecodepro"
#wget https://github.com/adobe-fonts/source-code-pro/raw/release/TTF/SourceCodePro-Regular.ttf -P "${ROOTFS_DIR}/usr/share/fonts/truetype/sourcecodepro"
#wget https://github.com/adobe-fonts/source-code-pro/releases/download/2.030R-ro%2F1.050R-it/source-code-pro-2.030R-ro-1.050R-it.zip -P files
unzip files/source-code-pro-2.030R-ro-1.050R-it-TTF.zip -d "files/source-code-pro"
install -v -m 644 files/source-code-pro/* "${ROOTFS_DIR}/usr/share/fonts/truetype/sourcecodepro"
rm -r files/source-code-pro/

install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/gtkrc-2.0 "${ROOTFS_DIR}/home/pi/.gtkrc-2.0"

#install -v -o ${PI_USER} -g ${PI_USER} -m 755 files/geany-gtk2 "${ROOTFS_DIR}/usr/bin/"
tar xzvf files/geany-1.33-gtk2.tar.gz -C "${ROOTFS_DIR}/usr/bin/"
install -v -o ${PI_USER} -g ${PI_USER} -m 755 -d "${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/geany-gtk2/"
tar xzvf files/geany-1.33-gtk2-lib.tar.gz -C "${ROOTFS_DIR}/usr/lib/arm-linux-gnueabihf/geany-gtk2/"
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/geany.gtkrc "${ROOTFS_DIR}/usr/share/geany/"
install -v -o ${PI_USER} -g ${PI_USER} -m 700 -d "${ROOTFS_DIR}/home/pi/.config/"
install -v -o ${PI_USER} -g ${PI_USER} -m 700 -d "${ROOTFS_DIR}/home/pi/.config/geany"
install -v -o ${PI_USER} -g ${PI_USER} -m 700 -d "${ROOTFS_DIR}/home/pi/.config/geany/colorschemes"
git clone https://github.com/geany/geany-themes files/geany-themes
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/geany-themes/colorschemes/*.conf "${ROOTFS_DIR}/home/pi/.config/geany/colorschemes"
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/keybindings.conf "${ROOTFS_DIR}/home/pi/.config/geany/"
install -v -o ${PI_USER} -g ${PI_USER} -m 644 files/geany.conf "${ROOTFS_DIR}/home/pi/.config/geany/"
rm -rf files/geany-themes

rm -rf files/bcmstat
git clone https://github.com/MilhouseVH/bcmstat.git files/bcmstat
install -v -o ${PI_USER} -g ${PI_USER} -m 775 files/bcmstat/bcmstat.sh "${ROOTFS_DIR}/usr/local/bin/bcmstat"
install -v -o ${PI_USER} -g ${PI_USER} -m 444 files/bcmstat/LICENSE "${ROOTFS_DIR}/usr/local/bin/bcmstat.LICENSE"
rm -rf files/bcmstat

rm -f files/armbianmonitor files/armbianmonitor.LICENSE
wget https://raw.githubusercontent.com/armbian/build/master/packages/bsp/common/usr/bin/armbianmonitor -O "files/armbianmonitor"
wget https://raw.githubusercontent.com/armbian/build/master/LICENSE -O "files/armbianmonitor.LICENSE"
install -v -o ${PI_USER} -g ${PI_USER} -m 775 files/armbianmonitor "${ROOTFS_DIR}/usr/local/bin/"
install -v -o ${PI_USER} -g ${PI_USER} -m 444 files/armbianmonitor.LICENSE "${ROOTFS_DIR}/usr/local/bin/"
rm files/armbianmonitor files/armbianmonitor.LICENSE

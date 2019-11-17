#esptool
alias esptool.py='python3 /usr/local/lib/python3.7/dist-packages/esptool.py'
alias sudo='sudo '
#geany with GTK 2 and 3 library simultaneous 
alias geany-gtk2="LD_LIBRARY_PATH=/usr/lib/arm-linux-gnueabihf/geany-gtk2/  geany-gtk2"
alias geany-gtk3="/usr/bin/geany"
alias geany="if [ `cat /proc/cpuinfo | grep -e "^processor" | wc -l` = 1 ]; then geany-gtk2; else geany-gtk3; fi;"


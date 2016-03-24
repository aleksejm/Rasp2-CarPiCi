#!/bin/bash

echo -e "\e[1mPatch to fix CarPC system by Andrei Istodorescu  v0.1\e[0m"
echo ""



#echo -e "\e[1m- temporary use of sysvinit for autologin\e[0m"
#disable systemd, enable sysvinit
#sudo apt-get install sysvinit-core
#echo ""
echo -e "\e[1m- activating i²c, i²s and SPI\e[0m"
echo "dtparam=i2c_arm=on" | sudo tee -a /boot/config.txt
echo "dtparam=i2s=on" | sudo tee -a /boot/config.txt
echo "dtparam=spi=on" | sudo tee -a /boot/config.txt
echo ""
echo -e "\e[1m- manually installing libgrypt11 from debian.org\e[0m"
#get missing dependecies for KODI
wget -N http://ftp.us.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_armhf.deb
sudo dpkg -i libgcrypt11_1.5.0-5+deb7u3_armhf.deb
echo ""
echo -e "\e[1m- installing libtasn1-3, as libgnutls26 depends on it\e[0m"
sudo apt-get install libtasn1-3
echo ""
echo -e "\e[1m- manually installing libgnutls26 from debian.org\e[0m"
wget -N http://ftp.us.debian.org/debian/pool/main/g/gnutls26/libgnutls26_2.12.20-8+deb7u3_armhf.deb
sudo dpkg -i libgnutls26_2.12.20-8+deb7u3_armhf.deb
echo ""
#echo -e "\e[1m- copy original /etc/xdg/lxsession/LXDE-pi/autostart to ~/.config/lxsession/LXDE-pi\e[0m"
#cp /etc/xdg/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/
#echo ""
echo -e "\e[1mdone. Please restart system.\e[0m"

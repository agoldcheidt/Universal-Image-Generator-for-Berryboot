#!/bin/bash

# LibreELEC Stable Build Image Generator for Berryboot
# Copyright 2018 Alexander G.
# http://www.alexgoldcheidt.com
# https://github.com/agoldcheidt

if [ "$EUID" -ne 0 ]
then 
    echo 1>&2 "Please run as root"
    exit 1
fi

#date
date=$(date +"%d-%b-%Y")

sleep 1
clear
#Some arwork...
echo "---------------------------------------------------------------------"
echo "  _    _ _            ___ _    ___ ___   _____       _   _           ";
echo " | |  (_| |__ _ _ ___| __| |  | __/ __| |_   ____ __| |_(_)_ _  __ _ ";
echo " | |__| | '_ | '_/ -_| _|| |__| _| (__    | |/ -_(_-|  _| | ' \/ _\` |";
echo " |____|_|_.__|_| \___|___|____|___\___|   |_|\___/__/\__|_|_||_\__, |";
echo "                                                               |___/ ";
echo "---------------------------------------------------------------------"

echo ""
echo "#### LIBREELEC TESTING IMAGE GENERATOR FOR BERRYBOOT ####"
echo ""

#LibreELEC Testing Image Menu Selection
PS3='Please select your device: '
options=("Raspberry Pi 1/Zero" "Raspberry Pi 2/3" "All Raspberry Pi Devices" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Raspberry Pi 1/Zero")
		
echo ""
echo "#### DOWNLOADING LIBREELEC RPI1/ZERO URLs ####"
echo ""		
#Download website source code
wget -q -O - "http://mirrors.fe.up.pt/pub/libreelec/?C=M;O=D" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
#Correcting urls addresses
sed -i "s|LibreELEC|http://mirrors.fe.up.pt/pub/libreelec/LibreELEC|g" .download-link
#Selecting Rpi Build
sed -n '/LibreELEC-RPi2.arm-8.9.*.img.gz/p' .download-link > .download-link1
#Correcting Rpi1 url address
sed -i "s|LibreELEC-RPi2|LibreELEC-RPi|g" .download-link1
#getting latest version
head -n1 .download-link1 > .download-link-final
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
echo ""
echo "#### DOWNLOADING LIBREELEC RPI1/ZERO IMAGE ####"
echo ""
            aria2c -x 4 -s 4 -i ".download-link-final"
			clear
echo ""
echo "#### DECOMPRESSING LIBREELEC RPI1/ZERO IMAGE ####"
echo ""
			sudo gunzip LibreELEC-RPi*.img.gz
			sudo losetup -f -P LibreELEC-RPi*.img
			sudo mount /dev/loop0p1 /mnt
			sudo unsquashfs /mnt/SYSTEM
			sudo umount /mnt
			sudo losetup -d /dev/loop0
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI1/ZERO IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ LibreELEC.Official.RPi.Zero.Testing.Berryboot-$date.img -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi.arm* squashfs-root .download-link .download-link1 .download-link-final
			clear
echo ""
echo "#### LIBREELEC RPI1/ZERO IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;
        "Raspberry Pi 2/3")
echo ""
echo "#### DOWNLOADING LIBREELEC RPI2/RPI3 URLs ####"
echo ""		
#Download website source code
wget -q -O - "http://mirrors.fe.up.pt/pub/libreelec/?C=M;O=D" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
#Correcting urls addresses
sed -i "s|LibreELEC|http://mirrors.fe.up.pt/pub/libreelec/LibreELEC|g" .download-link
#Selecting Rpi Build
sed -n '/LibreELEC-RPi2.arm-8.9.*.img.gz/p' .download-link > .download-link1
#getting latest version
head -n1 .download-link1 > .download-link-final
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
echo ""
echo "#### DOWNLOADING LIBREELEC RPI2/RPI3 IMAGE ####"
echo ""
            aria2c -x 4 -s 4 -i ".download-link-final"
			clear
echo ""
echo "#### DECOMPRESSING LibreELEC RPI2/RPI3 IMAGE ####"
echo ""
			sudo gunzip LibreELEC-RPi2*.img.gz
			sudo losetup -f -P LibreELEC-RPi*.img
			sudo mount /dev/loop0p1 /mnt
			sudo unsquashfs /mnt/SYSTEM
			sudo umount /mnt
			sudo losetup -d /dev/loop0
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI2/RPI3 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ LibreELEC.Official.RPi2.RPi3.Testing.Berryboot-$date.img -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi2.arm* squashfs-root .download-link .download-link1 .download-link-final
			clear
echo ""
echo "#### LIBREELEC RPI2/RPI3 IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;
			"All Raspberry Pi Devices")
echo ""
echo "#### DOWNLOADING LIBREELEC RPI1/ZERO URLs ####"
echo ""		
#Download website source code
wget -q -O - "http://mirrors.fe.up.pt/pub/libreelec/?C=M;O=D" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
#Correcting urls addresses
sed -i "s|LibreELEC|http://mirrors.fe.up.pt/pub/libreelec/LibreELEC|g" .download-link
#Selecting Rpi Build
sed -n '/LibreELEC-RPi2.arm-8.9.*.img.gz/p' .download-link > .download-link1
#Correcting Rpi1 url address
sed -i "s|LibreELEC-RPi2|LibreELEC-RPi|g" .download-link1
#getting latest version
head -n1 .download-link1 > .download-link-final
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
echo ""
echo "#### DOWNLOADING LIBREELEC RPI1/ZERO IMAGE ####"
echo ""
            aria2c -x 4 -s 4 -i ".download-link-final"
			clear
echo ""
echo "#### DECOMPRESSING LIBREELEC RPI1/ZERO IMAGE ####"
echo ""
			sudo gunzip LibreELEC-RPi*.img.gz
			sudo losetup -f -P LibreELEC-RPi*.img
			sudo mount /dev/loop0p1 /mnt
			sudo unsquashfs /mnt/SYSTEM
			sudo umount /mnt
			sudo losetup -d /dev/loop0
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI1/ZERO IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ LibreELEC.Official.RPi.Zero.Testing.Berryboot-$date.img -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi.arm* squashfs-root .download-link .download-link1 .download-link-final
			clear
echo ""
echo "#### LIBREELEC RPI1/ZERO IMAGE READY! ####"
echo ""
clear
echo ""
echo "#### DOWNLOADING LIBREELEC RPI2/RPI3 URLs ####"
echo ""		
#Download website source code
wget -q -O - "http://mirrors.fe.up.pt/pub/libreelec/?C=M;O=D" | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
#Correcting urls addresses
sed -i "s|LibreELEC|http://mirrors.fe.up.pt/pub/libreelec/LibreELEC|g" .download-link
#Selecting Rpi Build
sed -n '/LibreELEC-RPi2.arm-8.9.*.img.gz/p' .download-link > .download-link1
#getting latest version
head -n1 .download-link1 > .download-link-final
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
echo ""
echo "#### DOWNLOADING LIBREELEC RPI2/RPI3 IMAGE ####"
echo ""
            aria2c -x 4 -s 4 -i ".download-link-final"
			clear
echo ""
echo "#### DECOMPRESSING LIBREELEC RPI2/RPI3 IMAGE ####"
echo ""
			sudo gunzip LibreELEC-RPi2*.img.gz
			sudo losetup -f -P LibreELEC-RPi*.img
			sudo mount /dev/loop0p1 /mnt
			sudo unsquashfs /mnt/SYSTEM
			sudo umount /mnt
			sudo losetup -d /dev/loop0
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI2/RPI3 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ LibreELEC.Official.RPi2.RPi3.Testing.Berryboot-$date.img -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi2.arm* squashfs-root .download-link .download-link1 .download-link-final
			clear
echo ""
echo "#### ALL LIBREELEC IMAGES READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done

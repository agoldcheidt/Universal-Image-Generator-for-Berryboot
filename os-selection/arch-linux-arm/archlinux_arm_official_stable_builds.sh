#!/bin/bash

# ArchLinux ARM Image Generator for Berryboot
# Copyright 2018-2021 Alexander G.
# https://www.alexgoldcheidt.com
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
echo "-------------------------------------------------------------"
echo "    _          _      _    _                  _   ___ __  __ ";
echo "   /_\  _ _ __| |_   | |  (_)_ _ _  ___ __   /_\ | _ \  \/  |";
echo "  / _ \| '_/ _| ' \  | |__| | ' \ || \ \ /  / _ \|   / |\/| |";
echo " /_/ \_\_| \__|_||_| |____|_|_||_\_,_/_\_\ /_/ \_\_|_\_|  |_|";
echo "                                                             ";
echo "-------------------------------------------------------------"

#base path to server
BASE="http://fl.us.mirror.archlinuxarm.org/os/"

#Names for Converted OS Images
NAME1="archlinuxarm_official_rpi1_zero_berryboot-$date.img"
NAME2="archlinuxarm_official_rpi2_rpi3_berryboot-$date.img"
NAME4="archlinuxarm_official_rpi4_berryboot-$date.img"

echo ""
echo "#### ARCH LINUX ARM IMAGE GENERATOR FOR BERRYBOOT ####"
echo ""

#ArchLinux ARM Image Menu Selection
PS3='Please select your device: '
options=("Raspberry Pi 1/Zero" "Raspberry Pi 2/3" "Raspberry Pi 4" "All Raspberry Pi Devices" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Raspberry Pi 1/Zero")
		
echo ""
echo "#### DOWNLOADING ARCH LINUX ARM RPI1/ZERO IMAGE ####"
echo ""
			sudo mkdir ArchLinux1
            aria2c -x 4 -s 4 "$BASE/ArchLinuxARM-rpi-latest.tar.gz"
			clear
echo ""
echo "#### DECOMPRESSING ARCH LINUX ARM RPI1/ZERO IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-latest.tar.gz -C ArchLinux1
clear
echo ""
echo "#### CONVERTING ARCH LINUX ARM RPI1/ZERO IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux1/etc/fstab
			sudo mksquashfs ArchLinux1/ $NAME1 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -rf ArchLinuxARM-rpi*.gz ArchLinux1
			clear
echo ""
echo "#### ARCH LINUX ARM RPI1/ZERO IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;
		"Raspberry Pi 2/3")
		
echo ""
echo "#### DOWNLOADING ARCH LINUX ARM RPI2/3 IMAGE ####"
echo ""
			sudo mkdir ArchLinux2
            aria2c -x 4 -s 4 "$BASE/ArchLinuxARM-rpi-2-latest.tar.gz"
			clear
echo ""
echo "#### DECOMPRESSING ARCH LINUX ARM RPI2/3 IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C ArchLinux2
clear
echo ""
echo "#### CONVERTING ARCH LINUX ARM RPI2/3 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux2/etc/fstab
			sudo mksquashfs ArchLinux2/ $NAME2 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -rf ArchLinuxARM-rpi*.gz ArchLinux2
			clear
echo ""
echo "#### ARCH LINUX ARM RPI2/3 IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;
		"Raspberry Pi 4")
		
echo ""
echo "#### DOWNLOADING ARCH LINUX ARM RPI4 IMAGE ####"
echo ""
			sudo mkdir ArchLinux4
            aria2c -x 4 -s 4 "$BASE/ArchLinuxARM-rpi-4-latest.tar.gz"
			clear
echo ""
echo "#### DECOMPRESSING ARCH LINUX ARM RPI4 IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-4-latest.tar.gz -C ArchLinux4
clear
echo ""
echo "#### CONVERTING ARCH LINUX ARM RPI4 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux4/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux4/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux4/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux4/etc/fstab
			sudo mksquashfs ArchLinux4/ $NAME4 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -rf ArchLinuxARM-rpi*.gz ArchLinux4
			clear
echo ""
echo "#### ARCH LINUX ARM RPI4 IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;			
		"All Raspberry Pi Devices")
echo ""
echo "#### DOWNLOADING ARCH LINUX ARM RPI1/ZERO IMAGE ####"
echo ""
			sudo mkdir ArchLinux1
            aria2c -x 4 -s 4 "$BASE/ArchLinuxARM-rpi-latest.tar.gz"
			clear
echo ""
echo "#### DECOMPRESSING ARCH LINUX ARM RPI1/ZERO IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-latest.tar.gz -C ArchLinux1
clear
echo ""
echo "#### CONVERTING ARCH LINUX ARM RPI1/ZERO IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux1/etc/fstab
			sudo mksquashfs ArchLinux1/ $NAME1 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -rf ArchLinuxARM-rpi*.gz ArchLinux1
			clear
echo ""
echo "#### ARCH LINUX ARM RPI1/ZERO IMAGE READY! ####"
echo ""
clear
echo ""
echo "#### DOWNLOADING ARCH LINUX ARM RPI2/3 IMAGE ####"
echo ""
			sudo mkdir ArchLinux2
            aria2c -x 4 -s 4 "$BASE/ArchLinuxARM-rpi-2-latest.tar.gz"
			clear
echo ""
echo "#### DECOMPRESSING ARCH LINUX ARM RPI2/3 IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C ArchLinux2
clear
echo ""
echo "#### CONVERTING ARCH LINUX ARM RPI2/3 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux2/etc/fstab
			sudo mksquashfs ArchLinux2/ $NAME2 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -rf ArchLinuxARM-rpi*.gz ArchLinux2
			clear
echo ""
echo "#### ARCH LINUX ARM RPI2/3 IMAGE READY! ####"
echo ""
clear
echo ""
echo "#### DOWNLOADING ARCH LINUX ARM RPI4 IMAGE ####"
echo ""
			sudo mkdir ArchLinux4
            aria2c -x 4 -s 4 "$BASE/ArchLinuxARM-rpi-4-latest.tar.gz"
			clear
echo ""
echo "#### DECOMPRESSING ARCH LINUX ARM RPI4 IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-4-latest.tar.gz -C ArchLinux4
clear
echo ""
echo "#### CONVERTING ARCH LINUX ARM RPI4 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux4/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux4/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux4/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux4/etc/fstab
			sudo mksquashfs ArchLinux4/ $NAME4 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -rf ArchLinuxARM-rpi*.gz ArchLinux4
			clear
echo ""
echo "#### ALL ARCH LINUX ARM IMAGES READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done

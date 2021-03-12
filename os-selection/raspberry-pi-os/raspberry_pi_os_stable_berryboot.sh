#!/bin/bash

# Raspberry Pi OS Builds Image Generator for Berryboot
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
echo "--------------------------------------------------------------"
echo "  ___              _                        ___ _    ___  ___ ";
echo " | _ \__ _ ____ __| |__  ___ _ _ _ _ _  _  | _ (_)  / _ \/ __|";
echo " |   / _\` (_-< '_ \ '_ \/ -_) '_| '_| ||| |  _/ | | (_) \__ \ ";
echo " |_|_\__,_/__/ .__/_.__/\___|_| |_|  \_, | |_| |_|  \___/|___/";
echo "             |_|                     |__/                     ";
echo "--------------------------------------------------------------"

#Download URLs
URL1="https://berryboot.alexgoldcheidt.com/go/raspberry-pi-os-full-desktop"
URL2="https://berryboot.alexgoldcheidt.com/go/raspberry-pi-os-basic-desktop"
URL3="https://berryboot.alexgoldcheidt.com/go/raspberry-pi-os-lite"

#Names for Converted OS Images
NAME1="raspberry_pi_os_latest_full_desktop_berryboot-$date.img"
NAME2="raspberry_pi_os_latest_basic_desktop_berryboot-$date.img"
NAME3="raspberry_pi_os_latest_lite_berryboot-$date.img"

#Mount Points
MNT1="/mnt/raspberry-pi-os-boot"
MNT2="/mnt/raspberry-pi-os-rootfs"

echo ""
echo "#### RASPBERRY PI OS IMAGE GENERATOR FOR BERRYBOOT ####"
echo ""

#Raspberry Pi OS Image Menu Selection
PS3='Please select your device: '
options=("Raspberry Pi OS Full Desktop" "Raspberry Pi OS Basic Desktop" "Raspberry Pi OS Lite" "All Raspberry Pi OS Builds" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Raspberry Pi OS Full Desktop")
		
echo ""
echo "#### DOWNLOADING RASPBERRY PI OS FULL DESKTOP IMAGE ####"
echo ""
           aria2c -x 4 -s 4 "$URL1"
			clear
echo ""
echo "#### DECOMPRESSING RASPBERRY PI OS FULL DESKTOP IMAGE ####"
echo ""
			sudo unzip *armhf-full.zip
			sudo mkdir $MNT1 $MNT2
			sudo losetup loop55 -P *armhf-full.img
			sudo mount /dev/loop55p1 $MNT1
			sudo mount /dev/loop55p2 $MNT2
			sudo find $MNT2 -name 'cached_UTF-8_del.kmap.gz' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'apply_noobs_os_config.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'raspberrypi-net-mods.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo sed -i 's/^\PARTUUID/#\0/g' $MNT2/etc/fstab
			sudo rm -f $MNT1/kernel* $MNT1/*.elf
			sudo cp -R $MNT1/* $MNT2/boot/
clear
echo ""
echo "#### CONVERTING RASPBERRY PI OS FULL DESKTOP IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs $MNT2 $NAME1 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo umount $MNT1 $MNT2
			sudo losetup -d /dev/loop55
			sudo rm -rf *armhf-full* $MNT1 $MNT2
			clear
echo ""
echo "#### RASPBERRY PI OS FULL DESKTOP IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;
	"Raspberry Pi OS Basic Desktop")
		
echo ""
echo "#### DOWNLOADING RASPBERRY PI OS BASIC DESKTOP IMAGE ####"
echo ""
           aria2c -x 4 -s 4 "$URL2"
			clear
echo ""
echo "#### DECOMPRESSING RASPBERRY PI OS BASIC DESKTOP IMAGE ####"
echo ""
			sudo unzip *armhf.zip
			sudo mkdir $MNT1 $MNT2
			sudo losetup loop55 -P *armhf.img
			sudo mount /dev/loop55p1 $MNT1
			sudo mount /dev/loop55p2 $MNT2
			sudo find $MNT2 -name 'cached_UTF-8_del.kmap.gz' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'apply_noobs_os_config.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'raspberrypi-net-mods.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo sed -i 's/^\PARTUUID/#\0/g' $MNT2/etc/fstab
			sudo rm -f $MNT1/kernel* $MNT1/*.elf
			sudo cp -R $MNT1/* $MNT2/boot/
clear
echo ""
echo "#### CONVERTING RASPBERRY PI OS BASIC DESKTOP IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs $MNT2 $NAME2 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo umount $MNT1 $MNT2
			sudo losetup -d /dev/loop55
			sudo rm -rf *armhf* $MNT1 $MNT2
			clear
echo ""
echo "#### RASPBERRY PI OS BASIC DESKTOP IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;
	"Raspberry Pi OS Lite")
		
echo ""
echo "#### DOWNLOADING RASPBERRY PI OS LITE IMAGE ####"
echo ""
           aria2c -x 4 -s 4 "$URL3"
			clear
echo ""
echo "#### DECOMPRESSING RASPBERRY PI OS LITE IMAGE ####"
echo ""
			sudo unzip *armhf-lite.zip
			sudo mkdir $MNT1 $MNT2
			sudo losetup loop55 -P *armhf-lite.img
			sudo mount /dev/loop55p1 $MNT1
			sudo mount /dev/loop55p2 $MNT2
			sudo find $MNT2 -name 'cached_UTF-8_del.kmap.gz' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'apply_noobs_os_config.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'raspberrypi-net-mods.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo sed -i 's/^\PARTUUID/#\0/g' $MNT2/etc/fstab
			sudo rm -f $MNT1/kernel* $MNT1/*.elf
			sudo cp -R $MNT1/* $MNT2/boot/
clear
echo ""
echo "#### CONVERTING RASPBERRY PI OS LITE IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs $MNT2 $NAME3 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo umount $MNT1 $MNT2
			sudo losetup -d /dev/loop55
			sudo rm -rf *armhf-lite* $MNT1 $MNT2
			clear
echo ""
echo "#### RASPBERRY PI OS LITE IMAGE READY! ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: paypal.me/alexgoldc";
echo "-----------------------------------------------";
echo ""
			break
            ;;			
        "All Raspberry Pi OS Builds")
		
echo ""
echo "#### DOWNLOADING RASPBERRY PI OS FULL DESKTOP IMAGE ####"
echo ""
           aria2c -x 4 -s 4 "$URL1"
			clear
echo ""
echo "#### DECOMPRESSING RASPBERRY PI OS FULL DESKTOP IMAGE ####"
echo ""
			sudo unzip *armhf-full.zip
			sudo mkdir $MNT1 $MNT2
			sudo losetup loop55 -P *armhf-full.img
			sudo mount /dev/loop55p1 $MNT1
			sudo mount /dev/loop55p2 $MNT2
			sudo find $MNT2 -name 'cached_UTF-8_del.kmap.gz' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'apply_noobs_os_config.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'raspberrypi-net-mods.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo sed -i 's/^\PARTUUID/#\0/g' $MNT2/etc/fstab
			sudo rm -f $MNT1/kernel* $MNT1/*.elf
			sudo cp -R $MNT1/* $MNT2/boot/
clear
echo ""
echo "#### CONVERTING RASPBERRY PI OS FULL DESKTOP IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs $MNT2 $NAME1 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo umount $MNT1 $MNT2
			sudo losetup -d /dev/loop55
			sudo rm -rf *armhf-full* $MNT1 $MNT2
			clear
echo ""
echo "#### DOWNLOADING RASPBERRY PI OS BASIC DESKTOP IMAGE ####"
echo ""
           aria2c -x 4 -s 4 "$URL2"
			clear
echo ""
echo "#### DECOMPRESSING RASPBERRY PI OS BASIC DESKTOP IMAGE ####"
echo ""
			sudo unzip *armhf.zip
			sudo mkdir $MNT1 $MNT2
			sudo losetup loop55 -P *armhf.img
			sudo mount /dev/loop55p1 $MNT1
			sudo mount /dev/loop55p2 $MNT2
			sudo find $MNT2 -name 'cached_UTF-8_del.kmap.gz' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'apply_noobs_os_config.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'raspberrypi-net-mods.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo sed -i 's/^\PARTUUID/#\0/g' $MNT2/etc/fstab
			sudo rm -f $MNT1/kernel* $MNT1/*.elf
			sudo cp -R $MNT1/* $MNT2/boot/
clear
echo ""
echo "#### CONVERTING RASPBERRY PI OS BASIC DESKTOP IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs $MNT2 $NAME2 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo umount $MNT1 $MNT2
			sudo losetup -d /dev/loop55
			sudo rm -rf *armhf* $MNT1 $MNT2
			clear
echo ""
echo "#### DOWNLOADING RASPBERRY PI OS LITE IMAGE ####"
echo ""
           aria2c -x 4 -s 4 "$URL3"
			clear
echo ""
echo "#### DECOMPRESSING RASPBERRY PI OS LITE IMAGE ####"
echo ""
			sudo unzip *armhf-lite.zip
			sudo mkdir $MNT1 $MNT2
			sudo losetup loop55 -P *armhf-lite.img
			sudo mount /dev/loop55p1 $MNT1
			sudo mount /dev/loop55p2 $MNT2
			sudo find $MNT2 -name 'cached_UTF-8_del.kmap.gz' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'apply_noobs_os_config.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo find $MNT2 -name 'raspberrypi-net-mods.service' -exec sh -c 'rm -f $1' _ {} \;
			sudo sed -i 's/^\PARTUUID/#\0/g' $MNT2/etc/fstab
			sudo rm -f $MNT1/kernel* $MNT1/*.elf
			sudo cp -R $MNT1/* $MNT2/boot/
clear
echo ""
echo "#### CONVERTING RASPBERRY PI OS LITE IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs $MNT2 $NAME3 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo umount $MNT1 $MNT2
			sudo losetup -d /dev/loop55
			sudo rm -rf *armhf-lite* $MNT1 $MNT2
			clear
echo ""
echo "#### ALL RASPBERRY PI OS IMAGES READY! ####"
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

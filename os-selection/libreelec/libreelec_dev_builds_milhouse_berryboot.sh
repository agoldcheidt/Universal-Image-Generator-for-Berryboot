#!/bin/bash

# LibreELEC Alpha Builds Image Generator for Berryboot
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
echo "--------------------------------------------------------"
echo "  _    _ _            ___ _    ___ ___   ___  _____   __";
echo " | |  (_| |__ _ _ ___| __| |  | __/ __| |   \| __\ \ / /";
echo " | |__| | '_ | '_/ -_| _|| |__| _| (__  | |) | _| \ V / ";
echo " |____|_|_.__|_| \___|___|____|___\___| |___/|___| \_/  ";
echo "                                                        ";
echo "--------------------------------------------------------"

#base path to server
base="http://milhouse.libreelec.tv/builds/master/RPi/"

#Names for Converted OS Images
NAME1="libreelec_DEV_milhouse_kodi_18_leia_rpi1_zero_berryboot-$date.img"
NAME2="libreelec_DEV_milhouse_kodi_18_leia_rpi2_rpi3_berryboot-$date.img"

echo ""
echo "#### LIBREELEC DEV IMAGE GENERATOR FOR BERRYBOOT ####"
echo ""

#LibreELEC DEV Image Menu Selection
PS3='Please select your device: '
options=("Raspberry Pi 1/Zero" "Raspberry Pi 2/3" "All Raspberry Pi Devices" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Raspberry Pi 1/Zero")
		
echo ""
echo "#### DOWNLOADING LIBREELEC RPI1/ZERO URLs ####"
echo ""		
# download website source code
wget -q -O - http://milhouse.libreelec.tv/builds/master/RPi/ | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
# Correcting urls addresses
sed -i "s|LibreELEC|http://milhouse.libreelec.tv/builds/master/RPi/LibreELEC|g" .download-link
# getting latest version
tail -n1 .download-link > .download-link-final
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
			sudo find . -name '*.tar' -exec sh -c 'tar -xf $1' _ {} \;
			sudo find . -name 'SYSTEM' -exec sh -c 'unsquashfs $1' _ {} \;
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI1/ZERO IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ $NAME1 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi.arm* squashfs-root .download-link .download-link-final
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
# download website source code
wget -q -O - http://milhouse.libreelec.tv/builds/master/RPi2/ | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
# Correcting urls addresses
sed -i "s|LibreELEC|http://milhouse.libreelec.tv/builds/master/RPi2/LibreELEC|g" .download-link
# getting latest version
tail -n1 .download-link > .download-link-final
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
			sudo find . -name '*.tar' -exec sh -c 'tar -xf $1' _ {} \;
			sudo find . -name 'SYSTEM' -exec sh -c 'unsquashfs $1' _ {} \;
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI2/RPI3 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ $NAME2 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi2.arm* squashfs-root .download-link .download-link-final
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
# download website source code
wget -q -O - http://milhouse.libreelec.tv/builds/master/RPi/ | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
# Correcting urls addresses
sed -i "s|LibreELEC|http://milhouse.libreelec.tv/builds/master/RPi/LibreELEC|g" .download-link
# getting latest version
tail -n1 .download-link > .download-link-final
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
			sudo find . -name '*.tar' -exec sh -c 'tar -xf $1' _ {} \;
			sudo find . -name 'SYSTEM' -exec sh -c 'unsquashfs $1' _ {} \;
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI1/ZERO IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ $NAME1 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi.arm* squashfs-root .download-link .download-link-final
			clear
echo ""
echo "#### LIBREELEC RPI1/ZERO IMAGE READY! ####"
echo ""
clear
echo ""
echo "#### DOWNLOADING LIBREELEC RPI2/RPI3 URLs ####"
echo ""		
# download website source code
wget -q -O - http://milhouse.libreelec.tv/builds/master/RPi2/ | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//' > .download-link
# Correcting urls addresses
sed -i "s|LibreELEC|http://milhouse.libreelec.tv/builds/master/RPi2/LibreELEC|g" .download-link
# getting latest version
tail -n1 .download-link > .download-link-final
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
			sudo find . -name '*.tar' -exec sh -c 'tar -xf $1' _ {} \;
			sudo find . -name 'SYSTEM' -exec sh -c 'unsquashfs $1' _ {} \;
clear
echo ""
echo "#### CONVERTING LIBREELEC RPI2/RPI3 IMAGE TO BERRYBOOT ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' squashfs-root/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' squashfs-root/etc/fstab
			sudo mksquashfs squashfs-root/ $NAME2 -comp lzo -e lib/modules var/cache/apt/archives var/lib/apt/lists
			sudo rm -rf LibreELEC-RPi2.arm* squashfs-root .download-link .download-link-final
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

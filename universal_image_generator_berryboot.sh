#!/bin/bash

# Universal Image Generator for Berryboot
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
#Some artwork...
echo "-------------------------------------------------";
echo "  ___                   ___                      ";
echo " | _ ) ___ _ _ _ _ _  _/ __| ___ _ ___ _____ _ _ ";
echo " | _ \/ -_) '_| '_| || \__ \/ -_) '_\ V / -_) '_|";
echo " |___/\___|_| |_|  \_, |___/\___|_|  \_/\___|_|  ";
echo " 2019.02.28        |__/                          ";
echo "-------------------------------------------------";
echo ""
echo "#### INSTALLING DEPENDENCIES ####"
echo ""

#OS Menu Selection
PS3='Please select your OS: '
options=("Debian/Ubuntu" "CentOS" "Fedora" "ArchLinux" "Skip")
select opt in "${options[@]}"
do
    case $opt in
        "Debian/Ubuntu")
		
echo ""
echo "#### INSTALLING ARIA2/SQUASHFS-TOOLS ####"
echo ""		
#installing packages
sudo apt-get update && sudo apt-get install aria2 squashfs-tools -y
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
			break
            ;;
        "CentOS")
echo ""
echo "#### INSTALLING ARIA2/SQUASHFS-TOOLS ####"
echo ""		
#installing packages
sudo yum install aria2 squashfs-tools -y
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
			break
            ;;
			"Fedora")
echo ""
echo "#### INSTALLING ARIA2/SQUASHFS-TOOLS ####"
echo ""		
#installing packages
sudo dnf install aria2 squashfs-tools -y
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
			break
            ;;
			"ArchLinux")
echo ""
echo "#### INSTALLING ARIA2/SQUASHFS-TOOLS ####"
echo ""		
#installing packages
pacman -Syy --noconfirm aria2 squashfs-tools --force
echo ""
echo "#### DONE! ####"
echo ""
sleep 1
clear
			break
			;;
        "Skip")
            break
            ;;
        *) echo invalid option;;
    esac
done
sleep 1
clear

#     ___  ___   ___      _        _   _          
#    / _ \/ __| / __| ___| |___ __| |_(_)___ _ _  
#   | (_) \__ \ \__ \/ -_) / -_) _|  _| / _ \ ' \ 
#    \___/|___/ |___/\___|_\___\__|\__|_\___/_||_|
#                                                 

echo ""
echo "#### OPERATING SYSTEM SELECTION ####"
echo ""

#OS Menu Selection
PS3='Please select the OS: '
options=("LibreELEC (Kodi)" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "LibreELEC (Kodi)")

#Starting LibreELEC Script
bash <(wget -qO- https://git.io/fx6Zc)
		break
            ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done

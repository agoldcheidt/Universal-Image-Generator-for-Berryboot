#!/bin/bash

# LibreELEC Image Generator for Berryboot
# Copyright 2018-2019 Alexander G.
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
echo "----------------------------------------------------------"
echo "  _    _ _            ___ _    ___ ___   _  __        _ _ ";
echo " | |  (_) |__ _ _ ___| __| |  | __/ __| | |/ /___  __| (_)";
echo " | |__| | '_ \ '_/ -_) _|| |__| _| (__  | ' </ _ \/ _\` | |";
echo " |____|_|_.__/_| \___|___|____|___\___| |_|\_\___/\__,_|_|";
echo "                                                          ";
echo "----------------------------------------------------------"
echo ""
echo "#### LIBREELEC BUILD SELECTION ####"
echo ""

#LibreELEC ALPHA Image Menu Selection
PS3='Please select LibreELEC build: '
options=("LibreELEC Stable Builds [Official]" "LibreELEC Testing Builds [Official]" "LibreELEC Dev Builds [Milhouse]" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "LibreELEC Stable Builds [Official]")

#Starting Script
bash <(wget -qO- https://git.io/fx6ZW)
		break
            ;;
        "LibreELEC Testing Builds [Official]")
		
#Starting Script
bash <(wget -qO- https://git.io/fx6Z8)
		break
            ;;
			"LibreELEC Dev Builds [Milhouse]")
			
#Starting Script
bash <(wget -qO- https://git.io/fx6Z4)
		break
            ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done

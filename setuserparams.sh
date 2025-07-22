#!/bin/bash
############################################################
#  Activate  Profile                                       #
#  VE3RD                                      2019/11/18   #
############################################################
set -o errexit
set -o pipefail
ver="20250204"
dirn=/etc/mmdvmhost
declare -i pnum
args=("$@")

sudo mount -o remount,rw /
systemctl stop mmdvmhost

if [ -z "$4" ]; then
        exit
fi
	sudo mount -o remount,rw /

        sudo sed -i '/^\[/h;G;/General/s/\(^Callsign=\).*/\1'"$1"'/m;P;d' /etc/mmdvmhost
        sudo sed -i '/^\[/h;G;/General/s/\(^Id=\).*/\1'"$2"'/m;P;d' /etc/mmdvmhost

	DMRID="$2""$5"
        sudo sed -i '/^\[/h;G;/General/s/\(^Id=\).*/\1'"$DMRID"'/m;P;d' /etc/mmdvmhost


        sudo sed -i '/^\[/h;G;/DMR Network/s/\(^Password=\).*/\1'"$3"'/m;P;d' /etc/mmdvmhost


        sudo sed -i '/^\[/h;G;/DMR Network/s/\(^Password=\).*/\1'"$3"'/m;P;d' /etc/mmdvmhost


        sudo sed -i '/^\[/h;G;/Info/s/\(^RXFrequency=\).*/\1'"$m4"'/m;P;d' /etc/mmdvmhost
        sudo sed -i '/^\[/h;G;/Info/s/\(^TXFrequency=\).*/\1'"$m4"'/m;P;d' /etc/mmdvmhost

	

sleep 5
systemctl start mmdvmhost
sleep 2
sudo mount -o remount,ro /


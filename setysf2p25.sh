#!/bin/bash
############################################################
#  Set YSF2P25 Parameters                                  #
#							   #
#  Enable "$1" = 1 Sets YSF2P25 Mode			   #
#  Enable "$1" = 0 Clears YSF2P25 Mode & Sets DMR Master   #
#							   #
#  VE3RD                                      2020-01-27   #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /

           	sudo sed -i '/^\[/h;G;/System Fusion/s/\(Enable=\).*/\1'"$1"'/m;P;d' /etc/mmdvmhost
     		sudo sed -i '/^\[/h;G;/System Fusion Network/s/\(Enable=\).*/\1'"$1"'/m;P;d' /etc/mmdvmhost

          	sudo sed -i '/^\[/h;G;/Enabled/s/\(Enabled=\).*/\1'"$1"'/m;P;d' /etc/ysf2p25
#             	sudo sed -i '/^\[/h;G;/P25 Network/s/\(Enabled=\).*/\1'"$1"'/m;P;d' /etc/ysf2p25
            	sudo sed -i '/^\[/h;G;/P25 Network/s/\(StartupDstId=\).*/\1'"$2"'/m;P;d' /etc/ysf2p25

  #        	sudo sed -i '/^\[/h;G;/Network/s/\(Startup=\).*/\1YSF2P25/m;P;d' /etc/ysfgateway
         	sudo sed -i '/^\[/h;G;/Network/s/\(Static=\).*/\1'"$2"'/m;P;d' /etc/p25gateway

		sudo /usr/local/sbin/mmdvmhost.service restart  > /dev/null

           	sudo /usr/local/sbin/ysf2p25.service restart  > /dev/null
           	sudo /usr/local/sbin/p25gateway.service restart  > /dev/null

        fi



fi;

sudo mount -o remount,ro /



#!/bin/bash
############################################################
# Set YSF2P25 Parameters                                  #
#                                                         #
# Enable "$1" = 1 Sets YSF2P25 Mode                      #
# Enable "$1" = 0 Clears YSF2P25 Mode & Sets DMR Master  #
#                                                        #
# VE3RD                                      2020-01-27  #
############################################################
set -o errexit
set -o pipefail

# Remount filesystem as read-write
sudo mount -o remount,rw /

# Update configuration files based on $1 (enable/disable) and $2 (ID)
sudo sed -i '/^\[/h;G;/System Fusion/s/\(Enable=\).*/\1'"$1"'/m;P;d' /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/System Fusion Network/s/\(Enable=\).*/\1'"$1"'/m;P;d' /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/Enabled/s/\(Enabled=\).*/\1'"$1"'/m;P;d' /etc/ysf2p25
sudo sed -i '/^\[/h;G;/P25 Network/s/\(StartupDstId=\).*/\1'"$2"'/m;P;d' /etc/ysf2p25
sudo sed -i '/^\[/h;G;/Network/s/\(Static=\).*/\1'"$2"'/m;P;d' /etc/p25gateway

# Restart services to apply changes
sudo /usr/local/sbin/mmdvmhost.service restart > /dev/null
sudo /usr/local/sbin/ysf2p25.service restart > /dev/null
sudo /usr/local/sbin/p25gateway.service restart > /dev/null

# Remount filesystem as read-only
sudo mount -o remount,ro /


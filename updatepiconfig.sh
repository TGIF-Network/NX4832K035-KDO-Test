#!/bin/bash
##############################################################
# Script to activate Accept Changes in Pi-Star Config	     #
# in /home/pi-star/ directory                                #
#                                                            #
#                                                            #
# VE3RD                                         2025-03-31   #
##############################################################

sudo mount -o remount,rw /

#if [ -z "$1" ]; then
#  echo "syntax:   updatepi.sh <pi-star ssid or address> <password> "
#  exit
#fi

decode_string() {
    local input="$1"
    echo -n "$input" | base64 -d
}

encrypted=$(cat /etc/pspass)

decrypted=$(decode_string "$encrypted")
#echo "$decrypted"


pw="$decrypted"

piAddress=$(hostname)

curl -X POST http://"$piAddress"/admin/configure.php  -u "pi-star:$pw" -d "action=save" -d "config=1" &> /dev/null


status=$?

if [ $status -eq 0 ]; then
  echo "Update Script Status = OK"
else
   echo "Update Script Status = Failed"
fi

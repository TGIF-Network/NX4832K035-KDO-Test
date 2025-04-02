#!/bin/bash
####################################################################
#  Rest pi-star password                                           #
#                                                                  #
#  KF6S                                                 11-04-2019 #
####################################################################
set -o errexit
set -o pipefail

# Set value in $2 for Mode/Network

sudo mount -o remount,rw /

sudo chpasswd <<< "pi-star:raspberry"

#!/bin/bash
set -x 

root=`pwd`

cd $root/scctl
./scctl -u
sleep 4

cd $root/masterd
sh unload.sh

sleep 2

cd $root/target-mode/iscsi
sh unloadiscsi.sh

cd $root
#/sbin/rmmod qla2xxx
/sbin/rmmod vtldev 
/sbin/rmmod vtlcore 

/quadstorvtl/pgsql/etc/pgsql stop

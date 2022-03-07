#!/bin/bash

userName="root"
UDMServer="192.168.1.1"
backupsToKeep=7
backupPath="/volume1/homes/admin/unifi_backups"

# https://github.com/akusei/pushover-bash
pushover_userkey= 
pushover_appkey= 
pushover_device= 
pushover_priority= 
pushover_title="UDM backup"
pushover_message="Error backing up UDM config files"



## Get latest backup

scp $userName@$UDMServer:/mnt/data/unifi-os/unifi/data/backup/autobackup/*.unf $backupPath/ \
||  ./pushover.sh -u $pushover_userkey -t $pushover_appkey -d $pushover_device -p $pushover_priority -T $pushover_title -m $pushover_message


## Clean up old backups

cd $backupPath
if [ $(ls -t |tail -n +$(( $backupsToKeep + 1 )) |wc -l) -gt 0 ]
then
  rm $(ls -t $backupPath |tail -n +$(( $backupsToKeep + 1 )))
 fi

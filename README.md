# udm-backup

Adapted from https://github.com/boostchicken-dev/udm-utilities/wiki/Backup-Your-UDM-Backup-Files-to-Another-Server to use pushover as error reporting instead of smtp

Place this script on a server (I use my Synology NAS) 

This script will copy UDM auto-backups (stored locally on the UDM) to the server and prune the server's copies to a specified number

Use a cron job (task scheduler on the NAS) to run on a schedule

The backup path on my NAS is then synced to an S3 bucket etc


## Requirements
- pushover.sh (https://github.com/akusei/pushover-bash) needs to be in the same directory as this script
- public key of the server is copied to udm's authorized keys (https://github.com/boostchicken-dev/udm-utilities/blob/master/on-boot-script/examples/udm-files/on_boot.d/15-add-root-ssh-keys.sh)

## Configuration
Edit the 'user adjustable variables' section in the script as required


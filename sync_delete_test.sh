#!/bin/sh

src="/Users/anton/Desktop/src/"
dst="/Users/anton/Desktop/dst"

now=$(date +"%Y-%m-%d-%H-%M")

log_dryrun="sync_delete_test_dryrun-$now.log"
log_sync="sync_delete_test-$now.log"



echo
command="rsync -avh --stats --delete --dry-run '$src' '$dst' | tee -a '$log_dryrun'"
echo "[*] rsync DRY-RUN command: $command"
echo "[*] rsync DRY-RUN command: $command" > $log_dryrun
eval $command

echo
echo "[*] Do you want to perform REAL SYNC?"
echo "[*] Type SYNC to continue"
read input

if [ $input == 'SYNC' ]
then
    echo
    command="rsync -avh --stats --delete '$src' '$dst' | tee -a '$log_sync'"
    echo "[*] rsync REAL-SYNC command: $command"
    echo "[*] rsync REAL-SYNC command: $command" > $log_sync
    eval $command
fi
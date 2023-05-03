#!/bin/bash

SOURCE=$HOME
DEST=file://$HOME/Backups/backups/

RESTORE_SOURCE=file://$HOME/Backups/backups_to_restore/
RESTORE_DEST=$HOME/Backups/restored_files/

EXCLUDE_FILELIST=$HOME/Projects/Other/backups/excluded-list.txt
FULL_EVERY="30D"
KEEP_FULL=2

display_usage() {
  echo "Usage:"
  echo " $0 [backup]"
  echo " $0 status"
  echo " $0 verify"
  echo " $0 list [timeAgo]"
  echo " $0 full-restore"
  echo " $0 restore-file filename [timeAgo]"
  echo " $0 help"

  echo ""
  echo "Examples:"
  echo "  $0"
  echo "  $0 list 3D"
  echo "  $0 restore-file myFile.txt"
  echo "  $0 restore-file directory/ 3D"
  exit 1
}

PASSPHRASE=$(security find-generic-password -a "$USER" -s duplicityPassphrase -w)

if [ -n "$PASSPHRASE" ]; then
  export PASSPHRASE
fi

if [ -z "$1" ] || [[ $1 = "backup" ]]; then

  echo "=========================================================================================="
  echo "Clean up any previously failed runs"
  echo "=========================================================================================="
  duplicity -v3 cleanup --force "${DEST}"

  echo "=========================================================================================="
  echo "Backing up to ${DEST}"
  echo "=========================================================================================="
  duplicity -v5 --full-if-older-than ${FULL_EVERY} --exclude-filelist "${EXCLUDE_FILELIST}" "${SOURCE}" "${DEST}"

  echo "=========================================================================================="
  echo "Removing all but ${KEEP_FULL} full backup from ${DEST}"
  echo "=========================================================================================="
  duplicity -v3 remove-all-but-n-full ${KEEP_FULL} --force "${DEST}"

elif [[ $1 = "status" ]]; then

  duplicity collection-status "${DEST}"

elif [[ $1 = "verify" ]]; then

  duplicity -v5 verify --compare-data --exclude-filelist "${EXCLUDE_FILELIST}" "${DEST}" "${SOURCE}"

elif [[ $1 = "list" ]]; then

  if [ -z "$2" ]; then
    duplicity list-current-files "${DEST}"
  else
    duplicity list-current-files -t "$2" "${DEST}"
  fi

elif [[ $1 = "full-restore" ]]; then

  duplicity -v5 "${RESTORE_SOURCE}" "${RESTORE_DEST}"

elif [[ $1 = "restore-file" ]]; then

  if [ -z "$2" ]; then
    display_usage
  else
    if [ -z "$3" ]; then
      duplicity -v5 --file-to-restore "$2" "${RESTORE_SOURCE}" "${RESTORE_DEST}"
    else
      duplicity -v5 -t "$3" --file-to-restore "$2" "${RESTORE_SOURCE}" "${RESTORE_DEST}"
    fi
  fi

else
  display_usage
fi

unset PASSPHRASE

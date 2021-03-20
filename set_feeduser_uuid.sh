#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi


uuid=$(sudo -u gvm bash -c "/opt/gvm/sbin/gvmd --get-users --verbose|cut -d " " -f2")
sudo -u gvm bash -c "/opt/gvm/sbin/gvmd --modify-setting 78eceaec-3385-11ea-b237-28d24461215b --value $uuid"

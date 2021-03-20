#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

sudo -u gvm bash -c "/opt/gvm/sbin/greenbone-feed-sync --type GVMD_DATA"
sudo -u gvm bash -c "/opt/gvm/sbin/greenbone-feed-sync --type SCAP"
sudo -u gvm bash -c "/opt/gvm/sbin/greenbone-feed-sync --type CERT"


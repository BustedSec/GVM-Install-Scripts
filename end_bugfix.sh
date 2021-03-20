#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

mkdir -p /var/run/ospd
touch /opt/gvm/var/run/ospd.sock 
chown gvm:gvm -R /var/run/ospd/
touch /opt/gvm/var/run/gvmd.pid 
chown gvm:gvm -R /opt/gvm/var/run/

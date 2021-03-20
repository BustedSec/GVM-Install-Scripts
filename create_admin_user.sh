#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi
chown -R gvm /opt/gvm
sudo -u gvm 'bash' <<EOF
cd /opt/gvm/sbin
./gvmd --create-user=admin --password=admin
EOF

#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

sudo -u gvm 'bash' <<EOF
source /etc/profile.d/gvm.sh
greenbone-nvt-sync
EOF


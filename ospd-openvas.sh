#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

sudo -u gvm 'bash' <<EOF
cd /opt/gvm/src
export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH
virtualenv --python python3 /opt/gvm/bin/ospd-scanner/
source /opt/gvm/bin/ospd-scanner/bin/activate
mkdir /opt/gvm/var/run/ospd/
cd ospd
pip3 install .
cd /opt/gvm/src
EOF

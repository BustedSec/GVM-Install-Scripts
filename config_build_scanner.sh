#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

sudo -u gvm 'bash' <<EOF
cd /opt/gvm/src/openvas 
export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH 
mkdir build 
cd build/ 
cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm .. 
make 
make doc 
make install 
EOF


















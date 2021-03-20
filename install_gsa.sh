#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

sudo -u gvm 'bash' <<EOF
cd /opt/gvm/src/gsa
export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH
mkdir build
cd build/
cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm -DCMAKE_BUILD_TYPE=RELEASE ..
make
make doc
make install
touch /opt/gvm/var/log/gvm/gsad.log 
EOF 

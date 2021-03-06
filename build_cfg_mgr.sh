#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

origdir=$("pwd")
cd /opt/gvm/src/gvmd
export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH
mkdir build
cd build/
cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm ..
make
make doc
make install
cd $origdir

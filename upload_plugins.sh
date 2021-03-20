#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

origdir=$("pwd")
cd /opt/gvm/sbin
./openvas -u
cd $origdir

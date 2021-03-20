#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

sudo -u gvm 'bash' <<EOF
# add list of cmds to execute
cd /opt/gvm/src/
git clone -b gvm-libs-20.08 --single-branch  https://github.com/greenbone/gvm-libs.git ;\
git clone -b openvas-20.08 --single-branch https://github.com/greenbone/openvas.git ;\
git clone -b gvmd-20.08 --single-branch https://github.com/greenbone/gvmd.git ;\
git clone -b master --single-branch https://github.com/greenbone/openvas-smb.git ;\
git clone -b gsa-20.08 --single-branch https://github.com/greenbone/gsa.git ;\
git clone -b ospd-openvas-20.08 --single-branch  https://github.com/greenbone/ospd-openvas.git ;\
git clone -b ospd-20.08 --single-branch https://github.com/greenbone/ospd.git
EOF


#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi


echo 'export PATH="$PATH:/opt/gvm/bin:/opt/gvm/sbin:/opt/gvm/.local/bin"' | tee -a /etc/profile.d/gvm.sh 
sudo chmod 0755 /etc/profile.d/gvm.sh 
source /etc/profile.d/gvm.sh 
chown gvm:gvm /etc/profile.d/gvm.sh 
sudo bash -c 'cat << EOF > /etc/ld.so.conf.d/gvm.conf
# gmv libs location
/opt/gvm/lib
EOF'

mkdir -p /opt/gvm/lib
adduser gvm --disabled-password --home /opt/gvm/ --no-create-home --gecos ''
usermod -aG redis gvm  # This is for ospd-openvas can connect to redis.sock.. If you have a better idea here, pls write in the comments :)
chown -R gvm:gvm /opt/gvm/
su - gvm -c "mkdir -p /opt/gvm/src"
su - gvm -c "cd /opt/gvm/src && export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH"
echo "PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/gvm/bin:/opt/gvm/sbin:/opt/gvm/.local/bin:/opt/gvm/.local/bin"" > /etc/environment #This is a dirty fix, figure out a better way to do this later. 

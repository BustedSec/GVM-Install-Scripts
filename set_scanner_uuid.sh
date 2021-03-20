#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi
#set -x
#trap read debug

#export PATH="$PATH:/opt/gvm/bin:/opt/gvm/sbin:/opt/gvm/.local/bin:/opt/gvm/.local/bin"
#sudo -u gvm '/bin/bash' <<EOF
#echo $PATH

#uuid=$(/opt/gvm/sbin/gvmd --get-scanners| tail -n +2 | tail -n +2 | cut -d" " -f1)
#uuid2=$(/opt/gvm/sbin/gvmd --get-scanners|awk 'FNR ==2 { print $1}')
#uuid3=/opt/gvm/sbin/gvmd --get-scanners|awk 'FNR ==2 { print $1}'

#echo $uuid3

uuid=$(sudo -u gvm bash -c "/opt/gvm/sbin/gvmd --get-scanners|awk 'FNR ==2 { print $1}'")
uuid2=$(echo $uuid | cut -d " " -f1)
sudo -u gvm bash -c "/opt/gvm/sbin/gvmd --modify-scanner=$uuid2 --scanner-host=/opt/gvm/var/run/ospd.sock"
sudo -u gvm bash -c "/opt/gvm/sbin/gvmd --modify-setting 78eceaec-3385-11ea-b237-28d24461215b --value $(/opt/gvm/sbin/gvmd --get-users --verbose | grep admin | awk {'print $2'})"

#EOF


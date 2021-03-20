#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi

cat > /etc/sudoers.d/99-openvas.conf  <<- "EOF"
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/op>
gvm ALL = NOPASSWD: /opt/gvm/sbin/openvas
gvm ALL = NOPASSWD: /opt/gvm/sbin/gsad
EOF
chmod 0440 /etc/sudoers.d/99-openvas.conf

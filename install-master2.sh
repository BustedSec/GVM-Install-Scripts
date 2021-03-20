#!/bin/bash
#root check
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root, sudo it up"
    exit
fi
!/usr/bin/env bash
. install_req.sh
. create_user.sh
. dl_stuff.sh
. install-gvm-libs.sh
. config-build-openvas-smb.sh
. config_build_scanner.sh
. redis_fix.sh
. add_to_sudoers.sh
. update_nvt.sh
. upload_plugins.sh
. build_cfg_mgr.sh
. config_postgres.sh
. fix_certs.sh
. create_admin_user.sh
. set_feeduser_uuid.sh
. sync_feeds.sh
. install_gsa.sh
. ospd-openvas.sh
. create_startup_scripts.sh
. set_scanner_uuid.sh
. end_bugfix.sh
. sync_feeds.sh

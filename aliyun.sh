#!/bin/sh
# Created by Simon [2024-8-17]
#
# For Ubuntu or other similar distros.
#
# Mount ALiYun Web Drive to local disk /mnt/aliyun
#
# Before running this script, you should do
# 1. sudo apt install fuse rclone
# 2. sudo pipx install aliyundrive-webdav
# 
# To run this script as a servie, please create the service file at /usr/lib/systemd/system/rclone.service
# then copy / paste the full codes until ends with underlines, and remove '#' in front of each of lines.
# after save this file , running command - sudo systemctl start rclone.service && sudo systemctl enable rclone.service
#
# [Unit]
# Description=Rclone
# After=network-online.target
#
# [Service]
# Type=simple
# ExecStart=/root/aliyun.sh
# Restart=on-abort
# User=root
#
# [Install]
# WantedBy=multi-user.target
#
#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
# the script does refers to the the guidances as follows: 
# https://rclone.org/webdav/
# https://southcat.net/2811.html

killall aliyundrive-webdav 2>&1 > /dev/null
killall rclone 2>&1 > /dev/null
# Please replace {token} as the exact token string as manually
/root/.local/bin/aliyundrive-webdav --host 0.0.0.0 -I --no-trash --no-self-upgrade -p 8080 -r {token} 2>&1 > /dev/null &
sleep 3
/usr/bin/fusermount -u /mnt/aliyun 2>&1 > /dev/null # force-unmount firstly
if [ ! -d /mnt/aliyun ]; then
        mkdir /mnt/aliyun
fi
/usr/bin/rclone mount webdav:/ /mnt/aliyun/ --async-read --dir-cache-time 15s --cache-dir /tmp --allow-other --vfs-cache-mode writes --allow-non-empty 2>&1 > /dev/null &

exit 0

#!/bin/sh
#
# uninstall udpxy on openwrt
#

BASE_PATH="/userdisk/appdata/udpxy"

killall udpxy
sleep 1

uci delete firewall.Udpxy_Autorun && \
uci commit firewall && \
/etc/init.d/firewall reload && \
echo "udpxy uninstalled successfully!"

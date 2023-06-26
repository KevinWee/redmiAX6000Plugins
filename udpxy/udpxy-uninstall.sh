#!/bin/sh
#
# uninstall udpxy on openwrt
#

BASE_PATH="/userdisk/appdata/udpxy"

uci delete firewall.Udpxy_Autorun && \
uci commit firewall && \
/etc/init.d/firewall reload && \
killall udpxy && \
echo "udpxy uninstalled successfully!"
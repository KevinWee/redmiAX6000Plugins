#!/bin/sh
#
# install udpxy on openwrt
#

BASE_PATH="/userdisk/appdata/udpxy"
BIND_IFNAME="br-iptv"
LISTEN_IFNAME="br-lan"

[ -n "$BIND_IFNAME" ] && \
[ -n "$LISTEN_IFNAME" ] && \
uci set firewall.Udpxy_Autorun=include && \
uci set firewall.Udpxy_Autorun.type='script' && \
uci set firewall.Udpxy_Autorun.path="${BASE_PATH}/start-udpxy-daemon.sh" && \
uci set firewall.Udpxy_Autorun.enabled='1' && \
uci set firewall.Udpxy_Autorun.reload='0' && \
uci commit firewall && \
${BASE_PATH}/start-udpxy-daemon.sh && \
/etc/init.d/firewall reload && \
echo "Udpxy installed successfully!"
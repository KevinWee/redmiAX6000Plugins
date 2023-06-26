#!/bin/sh
#
# uninstall wireguard on openwrt
#

BASE_PATH="/userdisk/appdata/wireguard"
WG_IFNAME="wg0"

[ -n "$WG_IFNAME" ] && \
[ -r "$BASE_PATH"/"$WG_IFNAME".conf ] && \
uci delete firewall.Wireguard_Zone && \
uci delete firewall.Wireguard_Forward_1 && \
uci delete firewall.Wireguard_Forward_2 && \
uci delete firewall.Wireguard_Forward_3 && \
uci delete firewall.Wireguard_Rule && \
uci delete firewall.Wireguard_Autorun && \
uci commit firewall && \
/etc/init.d/firewall reload && \
ip link del dev "$WG_IFNAME" && \
echo "wireguard uninstalled successfully!"
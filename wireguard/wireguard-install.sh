#!/bin/sh
#
# install wireguard on openwrt
#

BASE_PATH="/userdisk/appdata/wireguard"
WG_IFNAME="wg0"

[ -n "$WG_IFNAME" ] && \
[ -r "$BASE_PATH"/"$WG_IFNAME".conf ] && \
uci set firewall.Wireguard_Zone=zone && \
uci set firewall.Wireguard_Zone.name='wg' && \
uci set firewall.Wireguard_Zone.device='wg+' && \
uci set firewall.Wireguard_Zone.input='ACCEPT' && \
uci set firewall.Wireguard_Zone.output='ACCEPT' && \
uci set firewall.Wireguard_Zone.forward='REJECT' && \
uci set firewall.Wireguard_Forward_1=forwarding && \
uci set firewall.Wireguard_Forward_1.src='wg' && \
uci set firewall.Wireguard_Forward_1.dest='wan' && \
uci set firewall.Wireguard_Forward_2=forwarding && \
uci set firewall.Wireguard_Forward_2.src='wg' && \
uci set firewall.Wireguard_Forward_2.dest='lan' && \
uci set firewall.Wireguard_Forward_3=forwarding && \
uci set firewall.Wireguard_Forward_3.src='lan' && \
uci set firewall.Wireguard_Forward_3.dest='wg' && \
uci set firewall.Wireguard_Rule=rule && \
uci set firewall.Wireguard_Rule.name='Allow-WireGuard' && \
uci set firewall.Wireguard_Rule.src='wan' && \
uci set firewall.Wireguard_Rule.dest_port='51820' && \
uci set firewall.Wireguard_Rule.proto='udp' && \
uci set firewall.Wireguard_Rule.target='ACCEPT' && \
uci set firewall.Wireguard_Autorun=include && \
uci set firewall.Wireguard_Autorun.type='script' && \
uci set firewall.Wireguard_Autorun.path="${BASE_PATH}/start-wireguard-daemon.sh" && \
uci set firewall.Wireguard_Autorun.enabled='1' && \
uci set firewall.Wireguard_Autorun.reload='0' && \
uci commit firewall && \
${BASE_PATH}/start-wireguard-daemon.sh && \
/etc/init.d/firewall reload && \
echo "wireguard installed successfully!"
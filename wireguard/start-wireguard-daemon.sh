#!/bin/sh
#
# start wireguard on boot
#

BASE_PATH="/userdisk/appdata/wireguard"
WG_IFNAME="wg0"

[ -n "$WG_IFNAME" ] && \
[ -r "$BASE_PATH"/"$WG_IFNAME".conf ] && \
(ip link del dev "$WG_IFNAME" 2>/dev/null || true) && \
${BASE_PATH}/wireguard-go "$WG_IFNAME" && \
${BASE_PATH}/wg setconf "$WG_IFNAME" "$BASE_PATH"/"$WG_IFNAME".conf && \
ip addr add dev "$WG_IFNAME" 192.168.69.1/24 && \
ip link set dev "$WG_IFNAME" up && \
echo "wireguard started successfully!"

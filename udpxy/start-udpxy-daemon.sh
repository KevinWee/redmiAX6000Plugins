#!/bin/sh
#
# start udpxy on boot
#

BASE_PATH="/userdisk/appdata/udpxy"
BIND_IFNAME="br-iptv"
LISTEN_IFNAME="br-lan"
LISTEN_PORT="8666"

killall udpxy
sleep 5

[ -n "$BIND_IFNAME" ] && \
[ -r "$BASE_PATH"/udpxy ] && \
(ifconfig "$BIND_IFNAME" 192.168.1.3 up) && \
(${BASE_PATH}/udpxy -a "$LISTEN_IFNAME" -p "$LISTEN_PORT" -m "$BIND_IFNAME" -c 5 -B 65536) && \
echo "udpxy started successfully!"

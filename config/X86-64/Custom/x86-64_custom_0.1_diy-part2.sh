#!/bin/bash
#
# Copyright (c) 2019-2021 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate

# Display your name on the version
sed -i "s/OpenWrt/Openwrt by dogecore build $(TZ=UTC-8 date "+%y.%m.%d") @/g" package/lean/default-settings/files/zzz-default-settings

# Settings the empty password
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# Modify default Luci-Theme
sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial-ci/g' feeds/luci/collections/luci/Makefile

# Modify Default Network Settings Thanks:https://github.com/opalhair/OpenWrt-x86_64-firmware-2/blob/master/diy-part1.sh
echo 'Custom settings'
sed -i '$i uci set network.lan.ifname="eth1 eth2 eth3"' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci set network.wan.ifname="eth0"' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci set network.wan.proto=pppoe' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci set network.wan6.ifname="eth0"' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit network' package/lean/default-settings/files/zzz-default-settings

# Modify the word to 'Luci-app-poweroff'
sed -i 's/"吹灯拔蜡，关机回家"/"安全关机，某些机器不能完全断电，关机后只能通过手工重新启动。"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"关机，走你~"/"执行关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"设备有点懵，要等一下..."/"正在执行关机，请稍候"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"正在关机，说啥也不好使了..."/"正在关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po

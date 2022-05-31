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
sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial-ColorIcon/g' feeds/luci/collections/luci/Makefile

# Modify Default Network Settings Thanks:https://github.com/opalhair/OpenWrt-x86_64-firmware-2/blob/master/diy-part1.sh
echo 'Custom settings'
sed -i '$i uci set network.lan.ifname="eth1 eth2 eth3"' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci set network.wan.ifname="eth0"' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci set network.wan.proto=pppoe' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci set network.wan6.ifname="eth0"' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit network' package/lean/default-settings/files/zzz-default-settings

# Modify the word to 'luci-admin'
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po

# Modify the word to 'luci-app-ttyd'
sed -i 's/TTYD 终端/Terminal/g' feeds/luci/applications/luci-app-ttyd/po/zh-cn/terminal.po

# Modify the word to 'luci-app-zerotier'
sed -i 's/firstchild(), "VPN"/firstchild(), "Global Server"/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua

# Modify the word to 'luci-app-passwall2'
sed -i '16a entry({"admin", "vpn"}, firstchild(), "Global Server", 45).dependent = false' package/lean/passwall2/luci-app-passwall2/luasrc/controller/passwall2.lua
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/api/*.lua
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/api/*.lua
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/auto_switch/*.htm
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
sed -i 's/services/vpn/g' package/lean/passwall2/luci-app-passwall2/luasrc/view/passwall2/server/*.htm

# Modify the word to 'luci-app-ssr-plus'
sed -i '12a entry({"admin", "vpn"}, firstchild(), "GFW", 45).dependent = false' package/lean/ssrplus/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/services/vpn/g' package/lean/ssrplus/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/ssrplus/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/lean/ssrplus/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

# Modify the word to 'Luci-app-poweroff'
sed -i 's/"吹灯拔蜡，关机回家"/"安全关机，某些机器不能完全断电，关机后只能通过手工重新启动。"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"关机，走你~"/"执行关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"设备有点懵，要等一下..."/"正在执行关机，请稍候"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"正在关机，说啥也不好使了..."/"正在关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po

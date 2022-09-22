#!/bin/bash
#
# Copyright (c) 2019-2022 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: Lean_x86-64_99.1.sh
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

# Modify default Kernel Version #thanks: https://raw.githubusercontent.com/gd0772/patch/main/gd772.sh
# Kernel Version Check: https://github.com/coolsnowwolf/lede/blob/master/target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.18/KERNEL_TESTING_PATCHVER:=5.4/g' target/linux/x86/Makefile

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

# Modify the word to 'luci-app-ikoolproxy'
sed -i 's/iKoolProxy 滤广告/ikoolproxy/g' package/lean/luci-app-godproxy/luasrc/controller/*.lua
sed -i 's/iKoolProxy滤广告/ikoolproxy/g' package/lean/luci-app-godproxy/luasrc/model/cbi/koolproxy/*.lua
sed -i 's/iKoolProxy 滤广告/ikoolproxy/g' package/lean/luci-app-godproxy/luasrc/view/koolproxy/*.htm

# Modify the word to 'luci-app-webadmin'
sed -i 's/msgstr "Web 管理"/msgstr "Web"/g' feeds/luci/applications/luci-app-webadmin/po/zh-cn/webadmin.po


# Modify the word to 'luci-app-vsftpd'
#sed -i 's/网络存储/存储/g' feeds/luci/applications/luci-app-vsftpd/po/zh-cn/vsftpd.po

# Modify the word to 'luci-app-cifs-mount'
sed -i 's/挂载 SMB 网络共享/挂载共享/g' feeds/luci/applications/luci-app-cifs-mount/po/zh-cn/cifs.po

# Modify the word to 'luci-app-upnp'
sed -i 's/msgstr "UPnP"/msgstr "UPnP设置"/g' feeds/luci/applications/luci-app-upnp/po/zh-cn/upnp.po

# Modify the word to 'luci-app-zerotier', 'luci-app-ipsec-server', 'luci-app-softethervpn', 'luci-app-openvpn-server'
sed -i 's/firstchild(), "VPN"/firstchild(), "Journal"/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
#sed -i 's/firstchild(), "VPN"/firstchild(), "Journal"/g' feeds/luci/applications/luci-app-ipsec-server/luasrc/controller/ipsec-server.lua
#sed -i 's/firstchild(), "VPN"/firstchild(), "Journal"/g' feeds/luci/applications/luci-app-softethervpn/luasrc/controller/softethervpn.lua
#sed -i 's/firstchild(), "VPN"/firstchild(), "Journal"/g' feeds/luci/applications/luci-app-openvpn-server/luasrc/controller/openvpn-server.lua

# Modify the word to 'luci-app-passwall'
sed -i '18a entry({"admin", "vpn"}, firstchild(), "Journal", 45).dependent = false' package/lean/passwall/luci-app-passwall/luasrc/controller/passwall.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/api/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/auto_switch/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm

# Modify the word to 'luci-app-passwall2'
sed -i '16a entry({"admin", "vpn"}, firstchild(), "Journal", 45).dependent = false' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/controller/passwall2.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/api/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/model/cbi/passwall2/server/api/*.lua
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/auto_switch/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
sed -i 's/services/vpn/g' package/lean/openwrt-passwall2/luci-app-passwall2/luasrc/view/passwall2/server/*.htm

# Modify the word to 'luci-app-ssr-plus'
sed -i '12a entry({"admin", "vpn"}, firstchild(), "Journal", 45).dependent = false' package/lean/helloworld/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/services/vpn/g' package/lean/helloworld/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/lean/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

# Modify the word to 'Luci-app-poweroff'
sed -i 's/"吹灯拔蜡，关机回家"/"安全关机，某些机器不能完全断电，关机后只能通过手工重新启动。"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"关机，走你~"/"执行关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"设备有点懵，要等一下..."/"正在执行关机，请稍候"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"正在关机，说啥也不好使了..."/"正在关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po

# Modify the word to 'Luci-app-poweroff'
sed -i 's/"吹灯拔蜡，关机回家"/"安全关机，某些机器不能完全断电，关机后只能通过手工重新启动。"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"关机，走你~"/"执行关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"设备有点懵，要等一下..."/"正在执行关机，请稍候"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po
sed -i 's/"正在关机，说啥也不好使了..."/"正在关机"/g' package/lean/luci-app-poweroff/po/zh-cn/poweroff.po

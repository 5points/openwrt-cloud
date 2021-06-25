#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#
# Add a feed source
# sed -i '$a src-git lienol https://github.com/lienol/openwrt-package' feeds.conf.default

# Add a shadowsocks-r_plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../lean/luci-app-kodexplorer

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
rm -rf ../lean/luci-lib-docker
git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add a Smartinfo to plugin
svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add a plugin and theme
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon.git
git clone https://github.com/rosywrt/luci-theme-rosy.git
git clone https://github.com/project-lede/luci-app-godproxy.git
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
git clone https://github.com/rufengsuixing/luci-app-onliner.git
git clone https://github.com/esirplayground/luci-app-poweroff.git
popd

# 总是拉取官方golang版本，避免xray&v2ray编译错误 (https://github.com/Ljzkirito/Actions-Lean-RM2100/blob/main/diy-part2.sh)
mkdir -p feeds/packages/lang
pushd feeds/packages/lang
rm -fr golang && svn co https://github.com/openwrt/packages/trunk/lang/golang
popd

# 更新miniupnp版本
rm -fr feeds/packages/net/miniupnpd
svn co https://github.com/Ljzkirito/openwrt-packages/trunk/miniupnpd feeds/packages/net/miniupnpd
rm -fr feeds/luci/applications/luci-app-upnp
svn co https://github.com/Ljzkirito/openwrt-packages/trunk/luci-app-upnp feeds/luci/applications/luci-app-upnp

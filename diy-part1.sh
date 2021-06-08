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
git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add a Smartinfo to plugin
svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo

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


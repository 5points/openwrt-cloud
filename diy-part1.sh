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

# Add a plugin and theme
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon.git package/lean/luci-theme-atmaterial-ColorIcon
git clone https://github.com/rosywrt/luci-theme-rosy.git package/lean/luci-theme-rosy
git clone https://github.com/project-lede/luci-app-godproxy.git package/lean/luci-app-godproxy
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/lean/luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-onliner.git package/lean/luci-app-onliner
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff
git clone https://github.com/xiaorouji/openwrt-passwall.git package/lean/openwrt-passwall
# git clone https://github.com/jefferymvp/luci-app-koolproxyR.git package/lean/luci-app-koolproxyR
popd

# add luci-app-smartinfo
# git clone https://github.com/iamaluckyguy/luci-app-smartinfo.git package/lean/luci-app-smartinfo

# Add a Smartinfo to plugin
# pushd package/lean
# svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo ../package/lean/luci-app-smartinfo
# svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo ../luci-app-smartinfo
# svn co https://github.com/KFERMercer/OpenWrt/branches/master/package/kferm/luci-app-smartinfo
# popd
# git clone https://github.com/KFERMercer/OpenWrt.git ~/package/kferm/luci-app-smartinfo
# cp /home/runner/package/kferm/luci-app-smartinfo /home/runner/package/lean
# git clone https://github.com/iamaluckyguy/luci-app-smartinfo.git package/lean/luci-app-smartinfo

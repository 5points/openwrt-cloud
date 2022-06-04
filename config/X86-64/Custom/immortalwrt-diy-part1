#!/bin/bash
#
# Copyright (c) 2019-2022 P3TERX <https://p3terx.com>
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

# Settings Buildroot to openwrt #https://github.com/SuLingGG/OpenWrt-Rpi/blob/main/.github/workflows/build-x86_generic-lean-openwrt.yml
# echo "OPENWRTROOT=$PWD" >> $GITHUB_ENV
# echo "::set-output name=OPENWRTROOT::$(echo $PWD)"

# Make directory lean-package 
mkdir -p package/lean

# Add a shadowsocks-r_plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package ../lean/lienol-package
rm -rf ../lean/lienol-package-package/luci-app-kodexplorer

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
git clone -b luci https://github.com/xiaorouji/openwrt-passwall luci-passwall
mv luci-passwall/luci-app-passwall ../lean/openwrt-passwall/
rm -rf ../lean/luci-passwall

# Add luci-app-passwall2
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2

# Add a Smartinfo to plugin
svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add a plugin and theme
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon.git
git clone https://github.com/project-lede/luci-app-godproxy.git
git clone https://github.com/rufengsuixing/luci-app-onliner.git
git clone https://github.com/esirplayground/luci-app-poweroff.git

# theme source from https://github.com/kenzok8/openwrt-packages
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-mcat
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-tomato

popd

# Set to local feeds
sed -i '/src-git telephony/d' feeds.conf.default
echo "src-link telephony  $telephony _feed" >> feeds.conf.default
./scripts/feeds update -a

# 总是拉取官方golang版本，避免xray&v2ray编译错误 (https://github.com/Ljzkirito/Actions-Lean-RM2100/blob/main/diy-part2.sh)
pushd feeds/packages/lang
rm -fr golang && svn co https://github.com/openwrt/packages/trunk/lang/golang
popd

# Add netdata
rm -rf feeeds/packages/admin/netdata 
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ../package/lean/luci-app-netdata
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata luci/applications/luci-app-netdata
#cp -r temp/luci/applications/luci-app-netdata luci/applications/luci-app-netdata
#cp -r temp/packages/admin/netdata packages/admin/netdata

# Add luci-app-smartdns
# cp -r temp/luci/applications/luci-app-smartdns luci/applications/luci-app-smartdns
# cp -r temp/packages/net/smartdns packages/net/smartdns
# popd


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
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/lienol/openwrt-package' feeds.conf.default

# Add a plugin and theme
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon.git package/lean/luci-theme-atmaterial-ColorIcon
git clone https://github.com/rosywrt/luci-theme-rosy.git package/lean/luci-theme-rosy
git clone https://github.com/jefferymvp/luci-app-koolproxyR.git package/lean/luci-app-koolproxyR
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/lean/luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-onliner.git package/lean/luci-app-onliner
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff

# Add a Smartinfo to plugin
pushd package/
git clone https://github.com/KFERMercer/OpenWrt.git ~/package/kferm/luci-app-smartinfo
cp -r package/kferm/luci-app-smartinfo "../lean"
popd
# git clone https://github.com/ximliu/luci-app-smartinfo.git package/lean/luci-app-smartinfo

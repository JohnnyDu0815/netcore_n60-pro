#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add a feed source

sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default


#echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default

echo 'src-git small https://github.com/kenzok8/small.git;master' >>feeds.conf.default
echo 'src-git smpackage https://github.com/kenzok8/small-package.git;main' >>feeds.conf.default


#echo 'src-git OpenOray https://github.com/OrayOS/OpenOray.git' >>feeds.conf.default
#echo 'src-git gecoosac https://github.com/lwb1978/openwrt-gecoosac;main' >>feeds.conf.default
#echo 'src-git netspeedtest https://github.com/sirpdboy/netspeedtest.git' >>feeds.conf.default
#echo 'src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main' >>feeds.conf.default

#echo 'src-git lucky  https://github.com/sirpdboy/luci-app-lucky.git;main' >>feeds.conf.default 
#echo 'src-git wizard  https://github.com/sirpdboy/luci-app-wizard.git' >>feeds.conf.default
#echo 'src-git taskplan https://github.com/sirpdboy/luci-app-taskplan.git' >>feeds.conf.default
#echo 'src-git partexp https://github.com/sirpdboy/luci-app-partexp.git' >>feeds.conf.default
#echo 'src-git  Tailscale https://github.com/ZSKYC/luci-app-tailscale.git' >>feeds.conf.default

#echo 'src-git smpackage https://github.com/kenzok8/small-package.git;main' >>feeds.conf.default
#echo 'src-git small https://github.com/kenzok8/small.git;master' >>feeds.conf.default

#sed -i '/label = "ubi"/{n;s/reg = <0x580000 0x[0-9a-f]\+>/reg = <0x580000 0x1cc00000>/}' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-netcore-n60-pro.dts


 # echo "更新源git pull && feeds update"
 
#git pull 

#https://github.com/kenzok8/small
# 一键命令(防止插件冲突，删除重复)

echo -e "\033[31m =========== 一键命令 防止插件冲突，删除重复 =========== \033[0m"

./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}

rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang

rm -rf feeds/luci/applications/luci-app-passwall

echo  -e "\033[31m ===========  git clone 更新 golang  =========== \033[0m"
git clone https://github.com/kenzok8/golang.git feeds/packages/lang/golang

./scripts/feeds update -a && ./scripts/feeds install -a

echo -e "\033[31m ===========  结束 插件冲突删除重复 && 更新 golang  =========== \033[0m"

git clone https://github.com/JohnnyDu0815/luci-app-adguardhome package/luci-app-adguardhome
chmod -R 755 ./package/luci-app-adguardhome/*

#!/bin/sh
#====================================================
#	OpenWrt installation deployed to VPS
#	Author: Liveid
#	System Requirement: Ubuntu 16.04+ 、Debian 6+
#	Version: 2022
#====================================================
clear
echo "
 .....................   ...  ...    .....................
 ... ......... ... ...... ...  ......... ... ......... ...
 ... ......... ...  ...  ... ......... ... ......... ...
 ..................... ... ......... ......... .....................
 ......... ...............  ........................   ...
  ...... ......... ..................  ............... .........
 ...... ...  .......................................... ... ......
 ...... ...............  ...... ...  ............ ............
 ......... ............ ... ......  ..................... ...
 ..................... ........................... ... ...... ......
 ... ......... ... ..................... .................. ......
 ... ......... ... ............ ............  ............ ...
 ..................... ... .........  ..................... ......

"

#Fonts Color
red="\033[31m"
green="\033[32m"
blue="\033[36m"
redBG="\033[41;37m"
none="\033[0m"


#Check System
IS_OPENVZ=
if hostnamectl status | grep -q openvz; then
	IS_OPENVZ=1
fi

if [[ $IS_OPENVZ ]]; then
	echo
	echo -e "你的主机环境为 ${green}OpenVZ${none} ，不支持在此类主机部署，请更换${green}kvm${none}类主机再试"
	exit 0
fi

#Check User
if [ `id -u` -eq 0 ];then
	echo -e "${blue}Checking${none}..."
	echo
else
	echo -e "当前用户不是 ${green}root${none} 用户，请切换到 ${green}root${none} 用户或加上 ${redBG}sudo${none} 后重试"
	echo
	exit 0
fi

#Check Firmware
fwfile="./openwrt.img.gz"
if [ -e $fwfile ];then
	echo -e "${blue}Deploying${none}..."
	echo
	cp ./openwrt.img.gz /
else
	echo -e "请将gz格式的固件改名为${green} openwrt.img.gz ${none}并上传至当前目录，再运行此脚本。"
	exit 0
fi

#wget -c -O openwrt.img.gz  https://files.catbox.moe/shro6o.gz
wget -c -O openwrt.img.gz --no-check-certificate  https://files.catbox.moe/shro6o.gz

#File Preparation
#No Checking MD5
vps_kernel=$(uname -r)
openwrt-kernel="openwrt-kernel.bin"

wget -c --no-check-certificate https://github.com/liveid/OpenWrt-VPS/raw/main/$openwrt-kernel
cp $openwrt-kernel /boot/vmlinuz-$vps_kernel

echo -e "${red}Rebooting${none}..."
reboot

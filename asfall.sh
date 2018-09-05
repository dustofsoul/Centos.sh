#!/bin/bash
echo -e "此脚本将安装ASF screen wget unzip"

read -p "下载测试版？(yes or no)：" PRE 
ans=`echo "$PRE" |tr [[:upper:]] [[:lower:]] `
#判断是否需要测试版

check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
	bit=`uname -m`
}
#抄逗比大佬的
yum install -y screen wget unzip
rpm --import https://packages.microsoft.com/keys/microsoft.asc`
sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl= https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'
yum install -y libunwind libicu
yum install -y dotnet-sdk-2.1.105
#安装.NET
case $ans in
 yes|y)
    wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.6/ASF-linux-x64.zip
    ;;  
no|n)
    wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-x64.zip
    ;;  
*)
    echo "将下载稳定版"
    wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-x64.zip
    ;;  
esac
unset ANS ans
#下载ASF
unzip ASF-linux-x64.zip -d ASF/
cd ASF
chmod +x ArchiSteamFarm
cd config
echo -e "安装完成，请自行上传配置文件"

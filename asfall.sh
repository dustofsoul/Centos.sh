#!/bin/bash
echo -e "此脚本将安装ASF screen wget unzip"

read -p "下载测试版？(yes or no)：" PRE 
ans=`echo "$PRE" |tr [[:upper:]] [[:lower:]] `
#判断是否需要测试版
wget -qO- https://dot.net/v1/dotnet-install.sh | sudo bash
#安装.NET
case $ans in
 yes|y)
    wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.6/ASF-linux-${bit}.zip
    ;;  
no|n)
    wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-${bit}.zip
    ;;  
*)
    echo "将下载稳定版"
    wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-${bit}.zip
    ;;  
esac
unset ANS ans
#下载ASF
unzip ASF-linux-x64.zip -d ASF/
cd ASF
chmod +x ArchiSteamFarm
cd config
echo -e "安装完成，请自行上传配置文件"



#https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.6/ASF-linux-arm.zip
#https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-x64.zip
#下载地址
#https://github.com/JustArchi/ArchiSteamFarm/releases/download/%{ver}/ASF-linux-${bit}.zip

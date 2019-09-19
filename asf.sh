#!/bin/bash
echo -e "此脚本将安装ASF screen wget unzip"
ASF_ver=$(wget -qO- https://api.github.com/repos/JustArchi/ArchiSteamFarm/releases | grep -o '"tag_name": ".*"' |head -n 1| sed 's/"//g' | sed 's/tag_name: //g'
)
yum install -y screen wget unzip
wget https://dot.net/v1/dotnet-install.sh |bash
#安装.NET
wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/${ASF_ver}/ASF-linux-x64.zip
#下载ASF
unzip ASF-linux-x64.zip -d ASF/
rm -f ASF-linux-x64.zip
cd ASF
chmod +x ArchiSteamFarm
echo -e "安装完成，请自行上传配置文件"
exit 0

#!/bin/bash
echo -e "此脚本将安装ASF screen wget unzip"

yum install -y screen wget unzip
rpm --import https://packages.microsoft.com/keys/microsoft.asc`
sh -c 'echo -e "[packages-microsoft-com-prod]\nname=packages-microsoft-com-prod \nbaseurl= https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/dotnetdev.repo'
yum install -y libunwind libicu
yum install -y dotnet-sdk-2.1.105
#安装.NET
wget https://github.com/JustArchi/ArchiSteamFarm/releases/download/3.3.0.3/ASF-linux-x64.zip
#下载ASF
unzip ASF-linux-x64.zip -d ASF/
cd ASF
chmod +x ArchiSteamFarm
cd config
echo -e "安装完成，请自行上传配置文件"
exit 0

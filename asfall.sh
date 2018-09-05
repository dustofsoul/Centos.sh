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
	if [[ uname -m == "x86_64" ]]; then
		bit=x64
	elif [[ uname -m == "ARMv7" ]]
		bit=arm
	fi
}
#抄逗比大佬的

case "$release" in

centos)
	sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
	sudo yum -y update
	sudo yum install -y screen wget unzip dotnet-sdk-2.1
;;

debian8)
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
	sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
	wget -q https://packages.microsoft.com/config/debian/8/prod.list
	sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
	sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
	sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
	sudo apt-get update -y
	sudo apt-get install -y screen wget unzip dotnet-sdk-2.1
;;

debian9)
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
	sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
	wget -q https://packages.microsoft.com/config/debian/9/prod.list
	sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
	sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
	sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
	sudo apt-get update -y
	sudo apt-get install -y screen wget unzip dotnet-sdk-2.1
;;

ubuntu14)
wget -q https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get update -y
sudo apt-get install -y screen wget unzip dotnet-sdk-2.1
;;

ubuntu16)
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get update -y
sudo apt-get install -y screen wget unzip dotnet-sdk-2.1
;;

ubuntu17)
wget -q https://packages.microsoft.com/config/ubuntu/17.10/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get update -y
sudo apt-get install -y screen wget unzip dotnet-sdk-2.1
;;

ubuntu18)
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https
sudo apt-get update -y
sudo apt-get install -y screen wget unzip dotnet-sdk-2.1
;;
esac

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

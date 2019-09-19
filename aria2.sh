#!/bin/bash
yum groupinstall -y "Development Tools"
#get latest version
AR_ver=$(wget -qO- https://api.github.com/repos/q3aql/aria2-static-builds/releases | grep -o '"name": ".*"' |head -n 1| sed 's/"//g' | sed 's/name: aria2 //g')
wget -N "https://github.com/q3aql/aria2-static-builds/releases/download/v${AR_ver}/aria2-${AR_ver}-linux-gnu-64bit-build1.tar.bz2"
#
tar -jxvf aria2-${AR_ver}-linux-gnu-64bit-build1.tar.bz2
rm -f aria2-${AR_ver}-linux-gnu-64bit-build1.tar.bz2
mv aria2-${AR_ver}-linux-gnu-64bit-build1 aria2
cd aria2
make install
firewall-cmd --zone=public --add-port=6800/tcp --permanent
firewall-cmd --zone=public --add-port=6800/tcp

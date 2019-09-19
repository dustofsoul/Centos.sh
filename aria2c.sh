#!/bin/bash
yum groupinstall -y "Development Tools"
#https://api.github.com/repos/aria2/aria2/releases
#get latest version
AR_ver=$(wget -qO- https://api.github.com/repos/aria2/aria2/releases | grep -o '"name": ".*"' |head -n 1| sed 's/"//g' | sed 's/name: aria2 //g'
)
wget https://github.com/aria2/aria2/releases/download/release-${AR_ver}/aria2-${AR_ver}.tar.gz
tar -zxvf aria2-${AR_ver}.tar.gz
rm -f aria2-${AR_ver}.tar.gz
mv aria2${AR_ver} aria2
cd aria2
autoreconf -i
./configure ARIA2_STATIC=yes
make
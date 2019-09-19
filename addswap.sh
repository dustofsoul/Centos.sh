#! /bin/bash
if [[ -z $1 ]]; then
  size=512
else
  size=$1
fi
if [ -f "/swapfile" ]; then
  swapoff /swapfile
  rm -f "/swapfile"
fi
fallocate -l ${size}M /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

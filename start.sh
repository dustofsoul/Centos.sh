#!/bin/bash
echo "update system"
yum install -y epel-release
yum makecache
yum upgrade -y

adduser
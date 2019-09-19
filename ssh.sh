#!/bin/bash

if [ -f "${HOME}/.ssh/authorized_keys" ]; then
	echo "文件 ~/.ssh/authorized_keys 存在";
fi
#启用ssh秘钥登录
sed -i "/PubkeyAuthentication /c PubkeyAuthentication yes" sshd_config
sed -i "/RSAAuthentication /c RSAAuthentication yes" sshd_config
#禁用密码登录
sed -i "/PasswordAuthentication /c PasswordAuthentication no" sshd_config
systemctl restart sshd
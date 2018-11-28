#!/bin/bash
echo -e "此脚本将安装fail2ban"
yum install -y fail2ban
sysctel 
#创建配置文件
cat>/etc/fail2ban/jail.local<<EOF
[DEFAULT]
bantime=86400
findtime=300
maxretry = 5

# 邮件设置
#destemail = admin@domain.tld
#sender = fail2ban@domain.tld

banaction = firewallcmd-ipset
action = %(action_mwl)s
EOF

cat>/etc/fail2ban/sshd.local<<EOF
[sshd]
enabled = true
logpath = /var/log/fail2ban/
EOF

systemctl start faail2ban
systemctl enable faail2ban
systemctl restart sshd
systemctl restart ssh
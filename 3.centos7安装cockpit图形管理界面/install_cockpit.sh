
# Cockpit 是红帽开发的网页版图像化服务管理工具，优点是无需中间层，且可以管理多种服务。

# https://blog.51cto.com/u_14664141/6108121


yum install -y cockpit cockpit-docker cockpit-machines cockpit-dashboard cockpit-storaged cockpit-packagekit;


systemctl enable --now cockpit;

# 3.防火墙放行和关闭selinux
# ①关闭selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# ②放行防火墙
# 登录后复制 
# [root@192 network-scripts]# 
firewall-cmd --permanent --zone=public --add-service=cockpit;
# success
# [root@192 network-scripts]# 
# success

firewall-cmd --reload ;

# 访问9090端口即可
firewall-cmd --add-port=9090/tcp --permanent;
firewall-cmd --reload ;

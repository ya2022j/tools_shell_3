# 一、consul单机安装
# 1、安装
# 1.下载并解压consul
# https://www.cnblogs.com/wasfot/p/15160743.html

 cd /opt/

 mkdir consul

 chmod 777 consul

 cd consul

 wget https://releases.hashicorp.com/consul/1.3.0/consul_1.3.0_linux_amd64.zip

 unzip consul_1.3.0_linux_amd64.zip

 cp consul /usr/local/bin/

# 2. 检查是否安装成功
 consul

 consul version

# #前台启动
# consul agent -dev -ui -node=consul-dev -client=192.168.1.210


# 3.浏览器输入:http://IP:8500/出现ConsulWeb界面就表示成功了
# 2、设置开机自启动
# 一、路径/usr/lib/systemd/system/，新建一个service命名为，consul.service

# [Unit]
# Description=consul
# After=network.target

# [Service]
# ExecStart=/usr/local/consul/start.sh
# KillSignal=SIGTERM
    
# [Install]
# WantedBy=multi-user.target
# 二、编辑/usr/local/consul/start.sh

# #!/bin/bash
# consul agent -dev -ui -node=consul-dev -client=192.168.1.210 &;
# 三、执行命令

# systemctl start consul
# systemctl enable consul 
# systemctl status consul

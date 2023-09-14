

# https://zhuanlan.zhihu.com/p/639006414
# 1.rabbmitMQ 安装
# docker pull rabbitmq
# 2.rabbmitMQ 启动
# docker run -d --hostname my-rabbit --name rabbit -e RABBITMQ_DEFAULT_USER=用户名 -e RABBITMQ_DEFAULT_PASS=密码 -p 15672:15672 -p 5672:5672 rabbitmq:management
# 3.确认rabbitmq版本



# 下载符合版本的插件


wget https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez


# 4. 查看rabbitmq容器
# docker ps







# 5.将插件导入到容器
docker cp rabbitmq_delayed_message_exchange-3.8.0.ez 容器id:/opt/rabbitmq/plugins

# 6.进入此容器
docker exec -it 容器id /bin/bash

#7.进入插件列表查看插件
cd /opt/rabbitmq/plugins


# 8.安装消息管理插件
rabbitmq-plugins enable rabbitmq_shovel rabbitmq_shovel_management

# 9.查看插件
rabbitmq-plugins list

# 启动插件并重启容器
rabbitmq-plugins enable rabbitmq_delayed_message_exchange

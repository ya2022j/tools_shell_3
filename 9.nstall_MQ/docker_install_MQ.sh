# docker部署rabbitmq消息队列
# https://blog.csdn.net/weixin_56530349/article/details/127783304


# 一、首先我们在dockerhub上搜索rabbitmq镜像
#命令：
docker search rabbitmq:v3.11.2;

# （下载版本我们可以通过指定，也可以通过直接搜过rabbitmq获取dockerhub上的最新版本，例如docker search rabbitmq）



# 二、搜索完成后，我们有了目标镜像版本，下一步就是通过dockerhub把镜像下载到本地，方便我们直接使用镜像时再去下载镜像。
# #命令：docker pull rabbitmq
# （如果大家想拉取对应rabbitmq镜像版本的话，我们在rabbitmq后面加上“：版本”）

 docker pull rabbitmq;


# 因为我们本机的虚拟机已经是成功拉取过镜像，所以给出的是这个提示。正常拉取镜像时，会有一个pull的过程。

#  三、拉取镜像完成后，我们需要的就是通过docker来启动这个rabbitmq来帮助我们完成所需要的环境部署工作。
# #命令：docker run -d --hostname my-rabbit --name rabbit -p 15672:15672 -p 5673:5672 rabbitmq:3.11.2
# 安装启动rabbitmq容器
docker run -d --name myRabbitMQ -e RABBITMQ_DEFAULT_USER=zsr -e RABBITMQ_DEFAULT_PASS=123456 -p 15672:15672 -p 5672:5672 rabbitmq:3.8.14-management
# 需要注意几点：

# 1、-p 是mq内部外部映射端口，-p 外部端口：内部端口；
# 2、--hostname：指定容器主机名称
# 3、--name:指定容器名称

# 启动成功后，我们通过命令：docker ps  查看 rabbitmq的进程是否在运行。

docker run -d --hostname my-rabbit --name rabbit -p 15672:15672 -p 5673:5672 rabbitmq:3.11.2;

# *重要注意：此处如果docker启动失败，我们通过docker logs 镜像ID可以去查看下docker启动镜像日志，方便排查故障，例如端口冲突，容器名称冲突。

# #命令：docker logs 镜像ID
# 随后在通过 docker exec -it 容器id /bin/bash

# 例如：#命令docker exec -it a9e428d5f120 /bin/bash
# 进入容器内部后，在运行

#命令：rabbitmq-plugins enable rabbitmq_management


# 截至到此步骤，我们就可以通过web端去访问我们通过docker部署的rabbitmq。

# 四、访问
# 我们打开浏览器，直接搜对应的IP地址及端口即可，例如：http://本机ip:15672。

# 访问如图：



# 默认访问用户名：guest         密码：guest

# 登录成功如图：



# 到此的话，我们通过docker部署的rabbitmq就已经可以正常通过web端去访问。要提醒大家的是如果关闭计算机时未停止这个启动的容器，再次启动docker时会出现无法访问15672的情况，此时只需停止并移除这个容器，然后重启一次docker，重新执行启动rabbitmq容器的命令即可。



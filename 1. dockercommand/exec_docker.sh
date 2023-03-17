


# docker 关闭并删除所有的容器
docker stop $(docker ps -a -q);docker rm $(docker ps -a -q);

# docker 删除所有镜像
docker rmi -f $(docker images -a -q);



ps -ef | grep '$(docker ps -a -q)';


docker inspect $(docker ps -a -q) | grep volu;


# 迁移整个Docker容器
# 1、将/var/lib/docker迁移到另外一台实例，并启动docker,systemctl start docker
# 导入或导出docker容器内部的文件
# 执行命令
# # 命令语法
# # 容器文件导出到本地
# docker cp 容器ID:文件夹全限定名 本地目录
# # 本地文件导入到容器
# docker cp 本地目录 容器ID:文件夹全限定名
# # 如下
#  docker cp 670b66751f63:/var/lib/opengauss/data/pg_hba.conf .\openGauss\

docker cp 72010dbcf654:/usr/src/redmine/public/*  /opt/resource



# 安装Docker的简单管理工具Portainer。
# portainer包含一个Web UI，可让您轻松管理Docker容器，图像，网络和卷。portainer官方地址：https://portainer.io/install.html

# 1、运行如下命令，创建并运行portainer。

docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

# 2、查看portainer容器运行状态。

# docker ps -l
# docker ps 
# 1
# 2
# 3、浏览器输入dockerIP:9000 ，即可进入登陆界面。设置好密码（不少于8个字符），点击Create user。

1.删除旧版本
rpm -qa | grep mariadb
yum remove ...

sudo yum  -y remove $(rpm -qa | grep mariadb)
1
2
2.创建MariaDB.repo
vim /etc/yum.repos.d/MariaDB.repo

# 添加下面内容
[mariadb]
name=MariaDB
baseurl=http://mirrors.aliyun.com/mariadb/yum/10.3/centos7-amd64
gpgkey= http://mirrors.aliyun.com/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck = 1





3.安装
yum install MariaDB-server MariaDB-client -y


4.启动
systemctl start mariadb
systemctl enable mariadb # 设置开机启动


# 5.配置
# mysql_secure_installation

# Enter current password for root (enter for none):<–初次运行直接回车

# Set root password? [Y/n] <– 是否设置root用户密码，输入y并回车或直接回车

# New password: <– 设置root用户的密码

# Re-enter new password: <– 再输入一次你设置的密码

# Remove anonymous users? [Y/n] <– 是否删除匿名用户，Y，回车

# Disallow root login remotely? [Y/n] <–是否禁止root远程登录,N，回车,

# Remove test database and access to it? [Y/n] <– 是否删除test数据库，n,回车

# Reload privilege tables now? [Y/n] <– 是否重新加载权限表，回车



# 6.测试登录
# mysql -u root -p
# 1
# 7.配置字符集
# vim /etc/my.cnf

# # 添加
# [mysqld]
 
# init_connect='SET collation_connection = utf8_general_ci'
 
# init_connect='SET NAMES utf8'
 
# character-set-server=utf8
 
# collation-server=utf8_general_ci
 
# skip-character-set-client-handshake


# vim /etc/my.cnf.d/client.cnf

# # 在[client]添加
# default-character-set=utf8



# vim /etc/my.cnf.d/mysql-clients.cnf

# # 在[mysql]添加
# default-character-set=utf8


# 8.授予远程访问
# grant all privileges on *.* to username@'%' identified by 'password';

# 举例:
# grant all privileges on *.* to 'root'@'%' identified by '123456';
# flush privileges # 刷新

# 9.开启3306端口
# firewall-cmd --permanent --zone=public --add-port=3306/tcp

# firewall-cmd --permanent --zone=public --add-port=3306/udp
# firewall-cmd --reload


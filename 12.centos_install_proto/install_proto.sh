




# 下载压缩包
wget   https://github.com/protocolbuffers/protobuf/releases/download/v21.11/protobuf-all-21.11.zip ;



# ２．解压, tar zxvf protobuf-all-3.5.1.tar.gz．进入解压目录　cd protobuf-3.5.1/
unzip protobuf-all-21.11.zip;



cd protobuf-21.11;



# ３．安装依赖
 sudo yum -y install autoconf atuomake libtool;

#４．生成编译配置文件：
./autogen.sh;

# 第⼀步执行autogen.sh，但如果下载的是具体的某⼀门语言，不需要执行这⼀步。
# 第⼆步执行configure，有两种执行方式，任选其⼀即可，如下：
# 1、protobuf默认安装在 /usr/local 目录，lib、bin都是分散的
# 2、修改安装⽬录，统⼀安装在/usr/local/protobuf下

# ./configure --prefix  /usr/local/protobuf


#５．运行配置脚本，指定编译器，
./configure;

# ６．编译,安装
make && make install;

#7．更新库：
sudo ldconfig;


#8．测试：
protoc --version;



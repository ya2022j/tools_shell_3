cd /usr/local


 wget https://www.openssl.org/source/openssl-1.1.1s.tar.gz

tar -xzvf  openssl-1.1.1s.tar.gz

cd openssl-1.1.1s
yum install gcc
./config --prefix=/usr/local/openssl

make && make install 

rm -rf /usr/bin/openssl 

ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl

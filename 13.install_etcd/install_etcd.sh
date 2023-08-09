


wget https://github.com/etcd-io/etcd/releases/download/v3.4.14/etcd-v3.4.14-linux-amd64.tar.gz;


tar -zxvf etcd-v3.4.14-linux-amd64.tar.gz;
mv etcd-v3.4.14-linux-amd64 etcd;

cd etcd/

nohup ./etcd &

# test 

ps axu | grep etcd;

./etcdctl put aa 123;
./etcdctl get aa ;








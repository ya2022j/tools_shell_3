


# 确认之前已经安装了docker

# 1. Installation  https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# 2. minikube start --force --driver=docker

minikube start --force --driver=docker


# 使用Dashboard
minikube dashboard;

# 安装kubectl
curl -LO https://dl.k8s.io/release/v1.23.8/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
# 接着使用kubectl proxy开启代理：

# [docker@node3 ~]$ kubectl proxy --port=8888 --address='192.168.56.13' --accept-hosts='^.*' &
# [1] 10509
# [docker@node3 ~]$ Starting to serve on 192.168.56.13:8888
# 在宿主机浏览器中访问如下：

#  Exiting due to GUEST_PROVISION: error provisioning guest: Failed to start host: not enough CPUs is available for container

#!/bin/bash
#初始化机器环境

ip1=10.16.89.145
ip2=10.16.89.146
ip3=10.16.89.147
ip4=10.16.89.148

ssh-keygen

ssh-copy-id root@$ip1
ssh-copy-id root@$ip2
ssh-copy-id root@$ip3
ssh-copy-id root@$ip4

#install docker-machine
curl -L https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && chmod +x /tmp/docker-machine && sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

#install 4 docker machine
docker-machine create -d generic --generic-ip-address=$ip1 --generic-ssh-user=root mach1
docker-machine create -d generic --generic-ip-address=$ip2 --generic-ssh-user=root mach2
docker-machine create -d generic --generic-ip-address=$ip3 --generic-ssh-user=root mach3
docker-machine create -d generic --generic-ip-address=$ip4 --generic-ssh-user=root mach4

#check docker machine if install success
docker-machine ls 



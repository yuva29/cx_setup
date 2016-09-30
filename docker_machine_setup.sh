#!/bin/bash

dHostName="dCx"
ip=$1 #VM IP

echo "Creating docker machine: docker-machine create --driver generic --generic-ip-address ${ip} --generic-ssh-user vagrant ${dHostName}"
docker-machine create --driver generic --generic-ip-address ${ip} --generic-ssh-user vagrant ${dHostName}

echo "Setting docker host"
`eval "$(docker-machine env $dHostName)"`

echo "Running docker run -d training/postgres"
docker run -d training/postgres
         
if (docker ps | grep "training/postgres")
then 
  echo "Docker-machine created successfully!"
else
  echo "Docker-machine creation failed!"
fi

#vboxmanage controlvm cx-mgmt natpf1 cx_http,tcp,10.193.231.158,801,$ip,80
#vboxmanage controlvm cx-mgmt natpf1 cx_https,tcp,10.193.231.158,4431,$ip,443

cx=/home/yuva/cx/src/github.com/containerx/cx
#python $cx/build/deploy.py deploy

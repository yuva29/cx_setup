#! /bin/bash

cat .hostpubkey >> .ssh/authorized_keys

echo "Installing Unzip"
sudo apt-get install unzip

echo "Installing Zip"
sudo apt-get install zip

echo "Installing docker-machine"
sudo sh -c "curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \ 
chmod +x /usr/local/bin/docker-machine"

# for testing
sudo apt install ntp
sudo /etc/init.d/ntp restart 

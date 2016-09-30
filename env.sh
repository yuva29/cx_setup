#! /bin/bash
#set -euo pipefail

# Install MySQL as recommended in CX:NewHire.md
# Clone the code from git repo

export GOPATH=${HOME}/cx
export PATH=${GOPATH}/bin:${PATH}
cx=`pwd`/src/github.com/containerx/cx
cd $cx
git submodule init && git submodule update

export GOPATH=${GOPATH}:`pwd`/3rdparty
export CX_ROOT=`pwd`
pip install requests semver
make

cx_conf=${HOME}/cx/conf
mkdir -p $cx_conf
cp $cx/conf/config.json $cx_conf

export CX_CONFIG_PATH=$cx_conf
export MGMT_HOST="tcp://localhost:2376"

if !(grep -q "127.0.0.1 localhost wfm corc sddc" /etc/hosts) 
then
  echo "127.0.0.1 localhost wfm corc sddc" | sudo tee -a /etc/hosts
fi

# Add mysql config in config.json
#cd $cx
#make test


#!/bin/bash
apt-get update
apt-get install git
curl -L https://www.opscode.com/chef/install.sh | bash
wget http://github.com/opscode/chef-repo/tarball/master -O /home/ubuntu/master
cd /home/ubuntu && tar -xvf /home/ubuntu/master
mv /home/ubuntu/chef-* /home/ubuntu/chef-repo
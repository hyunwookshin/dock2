#!/usr/bin/env bash
if [ "$USER" != "centos" ]; then
   echo "Please run as 'centos'"
   exit 1
fi

set -e

# echo "Installing Mosh...."
# sudo yum install mosh -y
echo "Installing httpd-tools...."
sudo yum install httpd-tools -y
sudo setsebool httpd_can_network_connect on -P # see link below
echo "Installing nginx...."
sudo yum install nginx -y
echo "Installing zip/unzip...."
sudo yum install zip -y
sudo yum install unzip -y
echo "Installing docker...."
sudo yum install docker -y
echo "Installing epel-release...."
sudo yum install epel-release -y
echo "Installing python2 and numpy...."
# sudo yum install python-pip -y
# for centos 8 and above run
sudo yum install python2-devel -y
curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
pip install numpy==1.16.6 # python 2.7
pip install pyyaml
pip install prettytable
echo "Installing tmux, screen and vim...."
sudo yum install tmux -y
sudo yum install screen -y
sudo yum install vim -y
echo "Installing git...."
sudo yum install git -y
echo "Installing make and npm...."
sudo yum install make -y
sudo yum install npm -y
echo "Installing AWS tools...."
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
echo "Installing mysql..."
sudo yum install mysql -y
sudo yum groupinstall "Development Tools" -y
sudo yum install mysql-devel -y
pip install mysqlclient

#!/usr/bin/env bash

if [ "$USER" != "hshin" ]; then
   echo "Please run as 'hshin'"
   exit 1
fi
if [[ "1" == "" ]]; then
sudo mkdir -p /usr/share/nginx/html/private/alchem/solutions/
sudo mkdir -p /etc/nginx
sudo htpasswd -c /etc/nginx/.htpasswd hshin
sudo htpasswd -c /etc/nginx/.htpasswd testuser
fi

echo "Run 'ssh-keygen', and paste the key to github/bitbucket repositories. (then exit)."
bash
mkdir -p ~/wses
cd ~/wses
git clone git@github.com:hyunwookshin/alchemy.git
git clone git@github.com:hyunwookshin/algorithms.git
git clone git@bitbucket.org:shinhyunwook/nginx.git

sudo cp ~/wses/alchemy/nginx/*.conf /etc/nginx/

cd ~/wses/alchemy/src/frontend/frontend/ && make build

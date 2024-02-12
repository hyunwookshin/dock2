#!/usr/bin/env bash

if [ "$USER" != "hshin" ]; then
   echo "Please run as 'hshin'"
   exit 1
fi

sudo mkdir -p /usr/share/nginx/html/private/alchem/solutions/
htpasswd -c /etc/nginx/.htpasswd hshin
htpasswd -c /etc/nginx/.htpasswd testuser

echo "Run ssh-keygen, and paste the key to bitbucket repository."
read continued
mkdir wses
cd wses
if [ "$continued" == "Y" ]; then
   git clone git@bitbucket.org:shinhyunwook/alchemy.git
   git clone git@bitbucket.org:shinhyunwook/algorithms.git
   git clone git@bitbucket.org:shinhyunwook/nginx.git
fi

sudo cp ~/wses/alchemy/nginx/*.conf /etc/nginx/


cd ~/wses/alchemy/wses/frontend/frontend/ && make build

#!bin/bash

# Install Docker CE
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update -y
apt install docker-ce -y

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

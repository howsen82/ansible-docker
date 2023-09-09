# Install Ansible AWX Tower Ubuntu
apt install software-properties-common curl gnupg2 wget -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update -y
apt install docker-ce docker-ce-cli containerd.io -y
systemctl start docker
systemctl enable docker
systemctl status docker

# Install Docker Compose
apt install docker-compose -y

# Install Ansible and Other Dependency
apt install ansible -y

# Install Node js
apt install nodejs npm -y
npm install npm --global
apt install python3-pip git pwgen -y
pip3 install docker-compose==2.21.0

# Install Ansible AWS Tower
wget https://github.com/ansible/awx/archive/23.0.0.zip
unzip 23.0.0.zip
cd awx-23.0.0/installer
key=$(pwgen -N 1 -s 30)
tee inventory <<EOF
admin_user=admin
admin_password=secureadminpassword
secret_key=$key
EOF

# ansible-playbook -i inventory install-awx.yml
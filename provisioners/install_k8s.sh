#!/bin/bash

owner=$1

echo -e "\nInstalling Docker Engine...\n"
echo -e "This may take a while...\n"
sudo apt-get -y update

# Add Docker's official GPG key:
sudo apt-get -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker ${owner}

newgrp docker

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo -e "\nInstalling Kubectl\n"

sudo apt update -y
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#Validate the binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

#Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client --output=yaml

echo -e "\nInstalling Microk8s\n"
sudo snap install microk8s --classic
sudo usermod -a -G microk8s ${owner}
mkdir -p ~/.kube
chmod 0700 ~/.kube
newgrp microk8s
sudo microk8s status --wait-ready

microk8s enable dns
microk8s enable metrics-server
microk8s enable ingress
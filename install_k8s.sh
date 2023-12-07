#!/bin/bash

#---------------------------------------------
echo -e "\nInstalling kubectl\n"
echo -e "This may take a while...\n"
#---------------------------------------------
sudo apt update -y

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#Validate the binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

#Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client --output=yaml

#---------------------------------------------
echo -e "\nInstalling minikube\n"
echo -e "This may take a while...\n"
#---------------------------------------------
sudo apt update -y

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube start

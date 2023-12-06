#!/bin/bash

echo -e "\nInstalling minikube\n"
echo -e "This may take a while...\n"

sudo apt update -y

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

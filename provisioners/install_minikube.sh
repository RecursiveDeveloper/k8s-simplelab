#!/bin/bash

owner=$1

echo -e "\nInstalling Minikube\n"
echo "User set as default ${owner}"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

su - ${owner} <<EOF
    minikube start --nodes 1
    minikube status
EOF

echo -e "\nMinikube running on IP $(su - ${owner} -c 'minikube ip')\n"

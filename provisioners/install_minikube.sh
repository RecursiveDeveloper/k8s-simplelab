#!/bin/bash

OWNER=$1

echo -e "\nInstalling Minikube\n"
echo "User set as default $OWNER"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

su - $OWNER <<EOF
    minikube start --nodes 3
    minikube status
EOF

echo -e "\nMinikube running on IP $(su - $OWNER -c 'minikube ip')\n"

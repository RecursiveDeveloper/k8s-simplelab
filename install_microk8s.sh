#!/bin/bash

OWNER=$1

echo -e "\nInstalling MicroK8s\n"
echo "User set as default $OWNER"
sudo snap install microk8s --classic
microk8s status --wait-ready

sudo usermod -a -G microk8s $OWNER
sudo mkdir -p ~/.kube
sudo chown -f -R $OWNER ~/.kube
sudo newgrp microk8s

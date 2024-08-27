#!/bin/bash

echo -e "\nSetting up ingress controller\n"

kubectl create ns ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install -n ingress-nginx ingress-nginx ingress-nginx/ingress-nginx

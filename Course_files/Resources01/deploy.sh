#!/bin/bash

microk8s kubectl apply -f namespace.yaml
microk8s kubectl apply -f persistentVolume.yaml
microk8s kubectl apply -f persistentVolumeClaim.yaml
microk8s kubectl apply -f deployment.yaml
microk8s kubectl apply -f service.yaml

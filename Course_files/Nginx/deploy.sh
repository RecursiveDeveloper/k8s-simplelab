#!/bin/bash

OWNER=$1

manifest_files="/opt/Course_files/Nginx/manifests"
configmap_dir="/opt/Course_files/Nginx/config_files"
namespace="app"
configmap_name="nginx-config-dir"

su - $OWNER <<EOF
    kubectl create namespace ${namespace}

    kubectl create configmap ${configmap_name} \
        --from-file=${configmap_dir} \
        -n ${namespace}

    kubectl apply \
        -f $manifest_files/persistentVolume.yaml \
        -f $manifest_files/persistentVolumeClaim.yaml \
        -f $manifest_files/service.yaml \
        -f $manifest_files/deployment.yaml \
        -n ${namespace}

    sleep 25
    kubectl port-forward service/nginx-service 8081:80 \
        --address 0.0.0.0 \
        -n $namespace
EOF

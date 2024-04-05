#!/bin/bash

manifest_files="/opt/Course_files/Nginx"
configmap_dir="${manifest_files}/config_files"
secret_dir="${manifest_files}/secrets"

namespace="app"
configmap_name="nginx-config"
secret_name="nginx-secret"

microk8s kubectl create namespace ${namespace}

microk8s kubectl create configmap ${configmap_name} \
    --from-file=${configmap_dir} \
    -n ${namespace}

microk8s kubectl create secret generic ${secret_name} \
    --from-file=${secret_dir} \
    -n ${namespace}

microk8s kubectl apply \
    -f $manifest_files/persistentVolume.yaml \
    -f $manifest_files/persistentVolumeClaim.yaml \
    -f $manifest_files/service.yaml \
    -f $manifest_files/deployment.yaml \
    -n ${namespace}

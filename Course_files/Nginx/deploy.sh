#!/bin/bash

manifest_files="/opt/Course_files/Nginx"
configmap_dir="${manifest_files}/config_files"
namespace="app"
configmap_name="nginx-config-dir"

microk8s kubectl create namespace ${namespace}

microk8s kubectl create configmap ${configmap_name} \
    --from-file=${configmap_dir} \
    -n ${namespace}

microk8s kubectl apply \
    -f $manifest_files/persistentVolume.yaml \
    -f $manifest_files/persistentVolumeClaim.yaml \
    -f $manifest_files/service.yaml \
    -f $manifest_files/deployment.yaml \
    -n ${namespace}

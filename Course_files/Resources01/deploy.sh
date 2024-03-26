#!/bin/bash

namespace="app"
configmap_name="nginx-config-dir"
configmap_dir="/opt/Course_files/Resources01/nginx"
manifest_files="/opt/Course_files/Resources01"

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

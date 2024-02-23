#!/bin/bash

namespace="app"
configmap_name="nginx-config-dir"
configmap_dir="nginx"

microk8s kubectl create namespace ${namespace}

microk8s kubectl create configmap ${configmap_name} --from-file=${configmap_dir} -n ${namespace}

microk8s kubectl apply -f . -n ${namespace}

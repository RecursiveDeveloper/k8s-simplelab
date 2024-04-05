#!/bin/bash

namespace="app"
configmap_name="nginx-config"
secret_name="nginx-secret"

microk8s kubectl delete -f . -n ${namespace}
microk8s kubectl delete configmap ${configmap_name} -n ${namespace}
microk8s kubectl delete secret ${secret_name} -n ${namespace}
microk8s kubectl delete namespace ${namespace}

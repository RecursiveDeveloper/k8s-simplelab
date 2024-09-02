#!/bin/bash

owner=$1
ingress_exercise_folder=$2

nginx_manifests="${ingress_exercise_folder}/manifests"

namespace="ingress-nginx"

su - ${owner} <<EOF
    kubectl create namespace ${namespace}

    helm repo add ${namespace} https://kubernetes.github.io/ingress-nginx
    helm install -n ${namespace} ${namespace} ${namespace}/${namespace}

    kubectl apply \
        -f ${nginx_manifests}/httpd-deployment.yaml \
        -f ${nginx_manifests}/nginx-deployment.yaml \
        -f ${nginx_manifests}/httpd-service.yaml \
        -f ${nginx_manifests}/nginx-service.yaml
    
    ########################
    #Provisional validation webhook deletion due to unsolved error
    ########################
    kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission

    kubectl apply \
        -f ${nginx_manifests}/ingress-path.yaml \
        -f ${nginx_manifests}/ingress-host.yaml
EOF

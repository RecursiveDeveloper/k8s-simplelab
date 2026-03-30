#!/bin/bash

owner=$1
basic_exercise_folder=$2

nginx_manifests="${basic_exercise_folder}/manifests"
nginx_configmap="${basic_exercise_folder}/config_files"
nginx_debug="${basic_exercise_folder}/debug"

namespace="app"
configmap_name="nginx-config"

microk8s kubectl create namespace ${namespace}

microk8s kubectl create configmap ${configmap_name} \
  --from-file=${nginx_configmap} -n ${namespace}

microk8s kubectl apply \
  -f ${nginx_manifests}/persistentVolume.yaml \
  -f ${nginx_manifests}/persistentVolumeClaim.yaml \
  -f ${nginx_manifests}/service.yaml \
  -f ${nginx_manifests}/deployment.yaml \
  -f ${nginx_manifests}/job.yaml \
  -f ${nginx_manifests}/cronjob.yaml \
  -n ${namespace}

microk8s kubectl apply -f $nginx_debug/node-problem-detector.yaml

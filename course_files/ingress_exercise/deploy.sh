#!/bin/bash

OWNER=$1

course_files_dir="/opt/course_files/basic_exercise"
nginx_manifests="${course_files_dir}/manifests"
nginx_configmap="${course_files_dir}/config_files"

namespace="app"
configmap_name="nginx-config"

su - $OWNER <<EOF
    kubectl create namespace ${namespace}

    kubectl create configmap ${configmap_name} \
        --from-file=${nginx_configmap} \
        -n ${namespace}

    kubectl apply \
        -f $nginx_manifests/persistentVolume.yaml \
        -f $nginx_manifests/persistentVolumeClaim.yaml \
        -f $nginx_manifests/service.yaml \
        -f $nginx_manifests/deployment.yaml \
        -f $nginx_manifests/job.yaml \
        -f $nginx_manifests/cronjob.yaml \
        -n ${namespace}

    kubectl apply -f $course_files_dir/debug/node-problem-detector.yaml
EOF

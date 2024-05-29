#!/bin/bash

manifest_files="/opt/Course_files/Nginx/manifests"
namespace="app"

kubectl delete -f ${manifest_files} -n ${namespace}

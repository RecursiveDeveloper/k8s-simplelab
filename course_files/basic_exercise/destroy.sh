#!/bin/bash

manifest_files="/opt/course_files/basic_exercise/manifests"
namespace="app"

kubectl delete -f ${manifest_files} -n ${namespace}

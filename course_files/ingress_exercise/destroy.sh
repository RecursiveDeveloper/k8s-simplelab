#!/bin/bash

manifest_files="/opt/course_files/ingress_exercise/manifests"
namespace="app"

kubectl delete -f ${manifest_files}

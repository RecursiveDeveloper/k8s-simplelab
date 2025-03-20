#!/bin/bash

owner=$1
sync_folder=$2
basic_exercise_folder="${sync_folder}/basic_exercise"

echo -e "\nDeploying Kubernetes Manifests\n"
bash ${basic_exercise_folder}/deploy.sh ${owner} ${basic_exercise_folder}
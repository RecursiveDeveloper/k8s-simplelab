#!/bin/bash

owner=$1
sync_folder=$2
basic_exercise_folder="${sync_folder}/basic_exercise"
ingress_exercise_folder="${sync_folder}/ingress_exercise"

echo -e "\nFormatting Scripts - dos2unix\n"
apt install dos2unix -y
find ${sync_folder} -type f -print0 | xargs -0 dos2unix

# echo -e "\nDeploying Kubernetes Manifests\n"
# bash ${basic_exercise_folder}/deploy.sh ${owner} ${basic_exercise_folder}

echo -e "\nDeploying Kubernetes Ingress\n"
bash ${ingress_exercise_folder}/deploy.sh ${owner} ${ingress_exercise_folder}

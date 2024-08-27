#!/bin/bash

owner=$1
sync_folder=$2
basic_exercise_folder="${sync_folder}/basic_exercise"

echo -e "\nFormatting Scripts - dos2unix\n"
apt install dos2unix -y
find ${sync_folder} -type f -print0 | xargs -0 dos2unix

echo -e "\nDeploying Kubernetes Manifests\n"
bash ${basic_exercise_folder}/deploy.sh ${owner} ${basic_exercise_folder}

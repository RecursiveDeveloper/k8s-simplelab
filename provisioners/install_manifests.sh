#!/bin/bash

OWNER=$1

echo -e "\nFormatting Scripts - dos2unix\n"
apt install dos2unix -y
find "/opt/Course_files" -type f -print0 | xargs -0 dos2unix

echo -e "\nDeploying Kubernetes Manifests\n"
bash /opt/Course_files/Nginx/deploy.sh $OWNER

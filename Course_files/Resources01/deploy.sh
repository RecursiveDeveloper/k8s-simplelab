#!/bin/bash

namespace="app"

microk8s kubectl create namespace ${namespace}
microk8s kubectl apply -f . -n ${namespace}

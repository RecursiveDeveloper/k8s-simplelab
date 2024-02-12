#!/bin/bash

namespace="app"

microk8s kubectl delete -f . -n ${namespace}

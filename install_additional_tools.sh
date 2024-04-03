#!/bin/bash

echo -e "\nInstalling additional tools\n"
echo -e "This may take a while...\n"

sudo apt update -y

sudo apt install -y \
    jq \
    net-tools \
    htop

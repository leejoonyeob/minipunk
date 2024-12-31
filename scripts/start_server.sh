#!/bin/bash

DEPLOYMENT_PATH=$(pwd)

if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Installing Docker..."
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
fi
sudo systemctl start docker

docker load -i "$DEPLOYMENT_PATH/minipunk_image.tar"

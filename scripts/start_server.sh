#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Installing Docker..."
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
fi

docker load -i minipunk_image.tar

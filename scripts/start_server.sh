#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Installing Docker..."
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
fi
sudo systemctl start docker
docker load -i /home/ec2-user/minipunk_image.tar

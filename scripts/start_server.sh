#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Installing Docker..."
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
fi
sudo chmod 644 /home/ec2-user/test/minipunk_image.tar
sudo systemctl start docker
sudo docker load -i /home/ec2-user/test/minipunk_image.tar

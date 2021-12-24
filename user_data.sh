#!bin/bash
sudo yum -y update
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo aws ecr get-login-password --region eu-central-1 |sudo  docker login --username AWS --password-stdin 353641719040.dkr.ecr.eu-central-1.amazonaws.com
sudo sudo docker run -d -p 80:80 --name webapp  353641719040.dkr.ecr.eu-central-1.amazonaws.com/test:v5
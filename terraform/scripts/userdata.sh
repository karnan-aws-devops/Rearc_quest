#! bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo systemctl start docker

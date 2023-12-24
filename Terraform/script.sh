#!/bin/bash

# INSTALL Docker
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Install the Docker packages:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Install minikube cluster (stable release on x86-64 Linux using Debian package)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# Install kubectl
sudo snap install kubectl --classic

# Start the minukube
sudo usermod -aG docker $USER && newgrp docker

# minikube start --vm-driver=docker
minikube start --cpus 2 --memory 8192 --vm-driver=docker

sudo apt-get update
sudo apt-get install nginx

sudo nano /etc/nginx/sites-available/your_domain.com

server {
    listen 80;
    server_name your_domain.com www.your_domain.com; # Replace with your actual domain

    location / {
        proxy_pass http://localhost:3000; # Port where your app is running
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    # Add SSL/TLS configuration here if you have an SSL certificate
}

sudo ln -s /etc/nginx/sites-available/your_domain.com /etc/nginx/sites-enabled/

sudo nginx -t

sudo service nginx restart


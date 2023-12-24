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




# Replace with your actual domain and app port
DOMAIN="your_domain.com"
APP_PORT=3000

# Step 1: Install Nginx
sudo apt-get update
sudo apt-get install -y nginx

# Step 2: Create Nginx Configuration File
NGINX_CONF="/etc/nginx/sites-available/$DOMAIN"
sudo tee "$NGINX_CONF" > /dev/null <<EOL
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;

    location / {
        proxy_pass http://localhost:$APP_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }

    # Add SSL/TLS configuration here if you have an SSL certificate
}
EOL

# Step 3: Create a Symbolic Link
sudo ln -s "$NGINX_CONF" "/etc/nginx/sites-enabled/"

# Step 4: Test Nginx Configuration
sudo nginx -t

# Step 5: Restart Nginx
sudo service nginx restart

# Step 6: Adjust Firewall Rules (if needed)
# Make sure your security group allows incoming traffic on port 80 (HTTP) and, if applicable, port 443 (HTTPS).

# Step 7: Domain DNS Configuration
# Configure the DNS settings for your custom domain ("your_domain.com") in your domain registrar's control panel.

# Step 8: Testing
# Now, you can access your custom domain in a web browser, and Nginx will proxy requests to your locally running app on port $APP_PORT.

echo "Nginx configuration for $DOMAIN has been set up."

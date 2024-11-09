# Update package list and install prerequisites
sudo apt-get update

# Install Docker
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# To install the latest version
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# verify installation
sudo docker run hello-world

# install nginx
sudo apt-get install -y nginx

# Destination file
DESTINATION="/etc/nginx/sites-enabled/default"

# Download the reverse_proxy content file
sudo curl -o /home/content-nginx.txt https://pastorag.blob.core.windows.net/scripts/content-nginx.txt

# Copy the content to /etc/nginx/sites-enabled/default
sudo cp /home/content-nginx.txt $DESTINATION

# check nginx config
sudo nginx -t

# Restart NGINX
sudo systemctl restart nginx

# install az cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# login to az acr
sudo az acr login --name netca --username netca --password ufPqkDzziRBq+ZY07VaizfTck6A1/h8yNS2DbxconZ+ACRDvcj0V

# pull docker image

sudo docker pull netca.azurecr.io/samples/ca-one-app:latest

#  run the sample docker image

sudo docker run -d -p 3000:3000 --name ca-one-container netca.azurecr.io/samples/ca-one-app:latest


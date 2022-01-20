
#!/bin/bash

#Update System
sudo apt-get update

#Install Curl
sudo apt install curl -y

#Install Docker engine
curl https://get.docker.com | sudo bash
sudo usermod -aG docker $(whoami)

#Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl 

#Prepare Image
npm uninstall -g angular-cli @angular/cli
npm cache clean
npm install -g @angular/cli@latest
git clone https://github.com/spring-petclinic/spring-petclinic-angular.git
npm install --save-dev @angular/cli@latest
cd spring-petclinic-angular
docker build -t spring-petclinic-angular:latest .

#Run backend container
kubectl create -f frontend.yaml


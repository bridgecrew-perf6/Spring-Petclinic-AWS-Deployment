
#!/bin/bash

echo "Install Docker engine"
sudo apt-get Install docker.io -y 
sudo usermod -aG docker $USER

echo "Install Angular CLI"
sudo npm uninstall -g angular-cli @angular/cli
sudo npm cache clean --force
sudo npm install -g @angular/cli@latest

git clone https://github.com/spring-petclinic/spring-petclinic-angular.git
cd spring-petclinic-angular

sudo npm install --save-dev @angular/cli@latest
sudo npm install

echo "Run frontend container"
docker build -t spring-pet-clinic-angular:latest
docker run -p 8080:8080 spring-pet-clinic-angular:latest
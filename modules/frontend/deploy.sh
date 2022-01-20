
#!/bin/bash

echo "Install Docker engine"
sudo apt-get Install docker.io -y 
sudo usermod -aG docker $USER

echo "Run backend container"
kubectl create -f k8s/backend.yaml
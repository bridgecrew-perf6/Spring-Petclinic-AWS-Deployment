
#!/bin/bash

echo "Install Docker engine"
sudo apt-get Install docker.io -y 
sudo usermod -aG docker $USER

echo "Install kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl 

echo "Run backend container"
kubectl create -f backend.yaml
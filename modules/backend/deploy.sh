
#!/bin/bash

echo "Install Docker engine"
sudo apt-get Install docker.io -y 
sudo usermod -aG docker $USER

echo "Run backend container"
docker run -p 9966:9966 springcommunity/spring-petclinic-rest
docker stop container_04
docker rm container_04
docker rmi image_04:hello

export DOCKER_CONTENT_TRUST=1
docker build -t image_04:hello .   
docker images
docker run -d -p 80:81 --name container_04  image_04:hello
open http://localhost:80/
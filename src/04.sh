docker stop container_04
docker rm container_04
docker rmi image_04

docker build -t image_04 .   
docker images
docker run -d -p 80:81 --name container_04  image_04
docker exec -it container_04 spawn-fcgi -p 8080 webserver
open http://localhost:80/
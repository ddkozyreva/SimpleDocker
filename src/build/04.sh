# Чистка контейнеров и образов
docker stop container_04
docker rm container_04
docker rmi image_04:hello

# Cборка и проверка
cat dockerfiles/04 > Dockerfile

docker build -t image_04:hello .   
docker images
docker run -d -p 80:81 --name container_04  image_04:hello

open http://localhost:80/
open http://127.0.0.1:80/status

sleep 5
docker restart container_04

open http://localhost:80/
open http://127.0.0.1:80/status
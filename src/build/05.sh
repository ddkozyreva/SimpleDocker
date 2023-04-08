# Чистка контейнеров и образов
docker stop container_04
docker rm container_04
docker rmi image_04:hello
docker rmi image_04:appropriate

# Cборка и проверка
cat dockerfiles/05 > Dockerfile

export DOCKER_CONTENT_TRUST=1
docker build -t image_04:appropriate .   
docker images
docker run -d -p 80:81 --name container_04  image_04:appropriate

dockle image_04:appropriate

open http://localhost:80/
open http://127.0.0.1:80/status
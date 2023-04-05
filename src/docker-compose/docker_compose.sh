docker stop $(docker ps -a)
docker rm $(docker ps -a)
docker rmi $(docker images)
docker compose build
docker compose up
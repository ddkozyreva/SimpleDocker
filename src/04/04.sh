docker system prune -a -f
docker stop 04
docker rm 04
docker rmi 04
docker build -t 04 .   
docker images
docker run -d -p 81:81 --name 04 04
# docker exec -it 04 apt-get update
# docker exec -it 04 apt-get install -y gcc spawn-fcgi libfcgi-dev
docker cp 04/04.c 04:home/
docker cp ../nginx/nginx.conf 04:/etc/nginx/
docker exec -it 04 gcc /home/04.c -o /etc/nginx/webserver -lfcgi
docker exec -it 04 spawn-fcgi -p 8080 /etc/nginx/webserver
docker exec -it 04 service nginx reload 

open http://localhost:81/
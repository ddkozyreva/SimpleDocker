docker stop 03
docker rm 03
docker system prune -a -f

docker pull nginx
docker run -d -p 81:81 --name 03 nginx
docker exec -it 03 apt-get update
docker exec -it 03 apt-get install -y gcc spawn-fcgi libfcgi-dev
docker cp 03.c 03:home/
docker cp nginx.conf 03:/etc/nginx/
docker exec -it 03 gcc /home/03.c -o /etc/nginx/webserver -lfcgi
docker exec -it 03 spawn-fcgi -p 8080 /etc/nginx/webserver
docker exec -it 03 nginx -s reload 

open http://localhost:81/
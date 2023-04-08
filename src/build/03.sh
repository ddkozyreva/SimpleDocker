# Чистка неиспользуемых контейнеров и образов
docker stop 03
docker rm 03
docker system prune -a -f

# Скачиваем образ nginx и создаем контейнер, прослушивающий 81 порт
docker pull nginx
docker run -d -p 81:81 --name 03 nginx

# Обновляем пакеты системы и устанавливаем gcc spawn-fcgi libfcgi-dev
# -y = yes при запросе "Вы согласны установить то-то?"

docker exec -it 03 apt-get update
docker exec -it 03 apt-get install -y gcc spawn-fcgi libfcgi-dev

# Копируем файлы в контейнер
docker cp server/webserver.c 03:home/
docker cp server/nginx.conf 03:/etc/nginx/

# Запускаем сервер
docker exec -it 03 gcc /home/webserver.c -o /etc/nginx/webserver -lfcgi
docker exec -it 03 spawn-fcgi -p 8080 /etc/nginx/webserver
docker exec -it 03 service nginx reload 

# Проверяем
open http://localhost:81/
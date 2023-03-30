## Part 1. Готовый докер

1. Запустим докер и в терминале выкачаем официальный докер образ с помощью команды

```bash
docker pull nginx
```

2. Проверим образы

```bash
docker images
```

![1_1](../misc/images/1_1.png "1_1")

3. Запустим докер образ через

```bash
docker run -d [image_id|repository]
```

*docker run: Run a command in a new container*

*-d: Run container in background and print container ID*

4. Проверим, что докер запустился

```bash
docker ps
```

![1_2](../misc/images/1_2.png "1_2")

5. Для просмотра информации о контейнере воспользуемся

```bash
docker inspect [container_id|container_name]
```

Вывод команды внушительный, потому извлече только информацию о размере контейнера, списке замапленных портов и ip контейнера

![1_3](../misc/images/1_3.png "1_3")

6. Остановим докер образ и проверим, что образ остановился

```bash
docker stop [container_id|container_name]
```
![1_4](../misc/images/1_4.png "1_4")

7. Докер запускает сервис изолированно. Чтобы подключиться из внешней сети или с хоста к сервису нужно использовать сопоставление портов, или *маппинг*. С ним все запросы, проходящие через порт хоста, будут перенаправлены в докер-контейнер. Слева от двоеточия в команде ниже указываем порты нашей локальной машины, справа - контейнера. По умолчанию докер контейнер прослушивает порт 80.

```bash
docker run -d -p 443:80 -p 80:80 nginx
```

*-p: Publish a container's port(s) to the host*

![1_5](../misc/images/1_5.png "1_5")

Далее в строке браузера введем и проверим, что по данному адресу доступна стартовая страница nginx.

```bash
http://localhost:80
```


![1_6](../misc/images/1_6.png "1_6")


8. перезапустим контейнер и проверем, что он запустился

```bash
docker restart [container_id|container_name]
```

![1_7](../misc/images/1_7.png "1_7")


## Part 2. Операции с контейнером

1. Через команду прочитаем файл nginx.conf из контейнера

```
docker exec -it 0c cat etc/nginx/nginx.conf
```

_exec запускает команду в контейнере. -i - keep STDIN open even if not attached, -t - allocate a pseudo-TTY_

![2_1](../misc/images/2_1.png "2_1")

2. Создадим свой локальный файл и азпишем в него содержимое конфигурационного файла контейнера:

```
touch nginx.conf
docker exec -it 4b cat /etc/nginx/nginx.conf > nginx.conf
```

3. Добавим следующий куск кода в http {} в конфигурационном файле:

```
server {
        listen 80;
        listen [::]:80;
        location = /status {
          stub_status on;
        }
    }

```

4. Скопируем файл в контейнер и перезапустим контейнер с помощью exec:

```
docker cp nginx.conf [container_id|container_name]:etc/nginx/nginx.conf
docker exec -it [container_id|container_name] service nginx reload 
```

5. Проверим localhost:80/status:

```
 open http://127.0.0.1:80/status
```

![2_2](../misc/images/2_2.png "2_2")

![2_3](../misc/images/2_3.png "2_3")

+++

![2_4](../misc/images/2_4.png "2_4")

![2_5](../misc/images/2_5.png "2_5")

![2_6](../misc/images/2_6.png "2_6")


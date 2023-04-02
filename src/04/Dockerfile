# syntax=docker/dockerfile:1
   
FROM nginx
WORKDIR /webserver
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev
COPY nginx.conf .
# RUN gcc /home/04.c -o /etc/nginx/webserver -lfcgi && spawn-fcgi -p 8080 /etc/nginx/webserver
EXPOSE 8080
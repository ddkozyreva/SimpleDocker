# syntax=docker/dockerfile:1
   
FROM nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY server/webserver.c .
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev
RUN gcc webserver.c -o webserver -lfcgi
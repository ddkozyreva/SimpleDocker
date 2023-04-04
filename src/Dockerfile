# syntax=docker/dockerfile:1
   
FROM nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY server/webserver.c .
COPY run.sh .
RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    gcc webserver.c -o webserver -lfcgi
CMD ["bash", "run.sh"]
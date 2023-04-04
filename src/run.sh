#!/bin/bash
gcc /server/webserver.c -o /server/webserver -lfcgi
spawn-fcgi -p 8080 /server/webserver
service nginx start
# nginx -g "daemon off;"
sleep 10000
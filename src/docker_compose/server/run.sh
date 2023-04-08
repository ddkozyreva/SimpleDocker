#!/bin/bash
gcc /server/webserver.c -o /server/webserver -lfcgi
spawn-fcgi -p 8080 /server/webserver
service nginx start
while true; do sleep 5; done
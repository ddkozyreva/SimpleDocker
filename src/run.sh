#!/bin/bash
service nginx start
gcc /server/webserver.c -o /server/webserver -lfcgi
spawn-fcgi -p 8080 /server/webserver
service nginx reload
while true; do sleep 5; done
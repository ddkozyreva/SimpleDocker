#!/bin/bash
spawn-fcgi -p 8080 webserver
nginx -g "daemon off;"
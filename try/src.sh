#!/bin/bash

nginx -g "daemon off;" &
java -jar /etc/usr/SimpleWebServer-mod-0.0.1.jar  -root / -port 8080


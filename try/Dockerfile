ARG version=amd64/openjdk:24-slim
FROM $version
MAINTAINER Kirill
LABEL image="lite-version container with Java-app and Nginx"
ENV user=root
USER $user
COPY . /etc/usr
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y systemctl
ONBUILD RUN nginx version
ADD https://github.com/Lunevspring/Perm.git .
COPY default /etc/nginx/sites-enabled/ 
RUN nginx -t && systemctl reload nginx
ARG port=8080 
EXPOSE $port
WORKDIR /etc/usr
RUN apt-get install -y htop && apt-get install -y lsof
RUN mkdir /logs
RUN echo "lsof -i :8080" >/logs/ports
VOLUME /logs
SHELL ["/bin/sh", "-c"]
STOPSIGNAL SIGTERM
HEALTHCHECK CMD ping -c http://localhost:8080/ || exit 1
ENTRYPOINT ["/etc/usr/src.sh"]

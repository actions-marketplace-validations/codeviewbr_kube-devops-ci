FROM golang:latest

LABEL "description"="Kube DevOps CI Tool Box"
LABEL maintainer="CodeView Consulting"
LABEL authors="Wilton Guilherme"
LABEL version="1.0"

COPY ./src/scripts /
COPY ./src/templates /srv/

RUN chmod +x /*.sh && sh /install.sh

ENTRYPOINT ["/entrypoint.sh"]  
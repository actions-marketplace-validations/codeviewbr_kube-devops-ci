FROM golang:latest

LABEL "description"="Kube DevOps CI Tools"
LABEL maintainer="CodeView Consulting"
LABEL authors="Wilton Guilherme"
LABEL version="1.1"

COPY ./src/scripts /
COPY ./src/templates /srv/

RUN chmod +x /*.sh && sh /install.sh

ENTRYPOINT ["/entrypoint.sh"]  
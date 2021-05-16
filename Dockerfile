FROM golang:latest

COPY ./src/scripts /
COPY ./src/templates /srv/

RUN chmod +x /*.sh && sh /install.sh && ls -lsa /srv/

ENTRYPOINT ["/entrypoint.sh"]  
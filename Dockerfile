FROM python:3.8-alpine

RUN mkdir -p /config &&\
    pip install  elasticsearch-curator==5.8.1 &&\
    rm -rf /var/cache/apk/*

COPY config_file.yml /config/

COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["curator","--config", "/config/config_file.yml", "/config/action_file.yml"]

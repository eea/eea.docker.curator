FROM python:3.6-alpine

RUN mkdir -p /config &&\
    pip install  elasticsearch-curator==5.7.6 &&\
    rm -rf /var/cache/apk/*

COPY config_file.yml /config/

COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["curator","--config", "/config/config_file.yml", "/config/action_file.yml"]

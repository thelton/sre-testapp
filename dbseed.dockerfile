FROM postgres:14

COPY ./docker-entrypoint.sh ./

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "executable" ]
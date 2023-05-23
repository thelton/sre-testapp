FROM postgres:14

COPY ./seed.sh ./seed.sh

RUN chmod +x /seed.sh

ENTRYPOINT [ "./seed.sh" ]
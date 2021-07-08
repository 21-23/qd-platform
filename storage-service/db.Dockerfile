FROM postgres:13

COPY ./db.init.sql /docker-entrypoint-initdb.d/

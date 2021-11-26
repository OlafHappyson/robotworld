FROM postgres:latest
USER postgres
EXPOSE 5432
ENV POSTGRES_PASSWORD=12345
ENV POSTGRES_DB world
COPY world.sql /docker-entrypoint-initdb.d/

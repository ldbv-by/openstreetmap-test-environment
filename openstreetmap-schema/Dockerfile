FROM openjdk:17-jdk-alpine

RUN apk add --no-cache  \
    curl postgresql-client &&  \
    mkdir -p /app/db /app/docker

COPY openstreetmap-schema.jar /app
COPY db/create-schema.sql /app/db/create-schema.sql
COPY docker/entrypoint.sh /app/docker/entrypoint.sh

RUN chmod +x /app/docker/entrypoint.sh

ENTRYPOINT ["/app/docker/entrypoint.sh"]

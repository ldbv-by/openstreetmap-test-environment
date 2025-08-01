FROM openjdk:17-jdk-alpine

RUN apk add --no-cache \
    curl \
    postgresql-client \
    dos2unix && \
    mkdir -p /app/db /app/docker

COPY openstreetmap-schema.jar /app
COPY db/create-schema.sql /app/db/create-schema.sql
COPY docker/entrypoint.sh /app/docker/entrypoint.sh

RUN dos2unix /app/docker/entrypoint.sh && chmod +x /app/docker/entrypoint.sh

ENTRYPOINT ["/app/docker/entrypoint.sh"]

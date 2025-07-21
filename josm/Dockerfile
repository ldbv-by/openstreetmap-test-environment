# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            curl \
            openjdk-17-jre \
            x11-apps \
            xauth \
            xserver-xorg-video-dummy \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /app/docker /app/presets /app/styles

COPY preferences.xml /root/.config/JOSM/
COPY docker/ /app/docker/
COPY presets/ /app/presets/
COPY styles/ /app/styles

RUN chmod +x /app/docker/entrypoint.sh

ENTRYPOINT ["/app/docker/entrypoint.sh"]
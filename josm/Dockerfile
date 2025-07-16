# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

RUN apt-get update && \
    apt-get install -y \
            curl \
            openjdk-17-jre \
            x11-apps \
            xauth \
            xserver-xorg-video-dummy \
    && rm -rf /var/lib/apt/lists/*

COPY preferences.xml /root/.config/JOSM/

ENTRYPOINT ["/app/docker/entrypoint.sh"]

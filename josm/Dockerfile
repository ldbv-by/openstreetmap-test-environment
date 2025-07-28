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


COPY josm.jar /app/josm.jar
COPY preferences.xml /root/.config/JOSM/
COPY plugins /root/.local/share/JOSM/plugins/

COPY presets/BasisDLM_BY_presets.zip /app/presets/BasisDLM_BY_presets.zip

COPY styles/BasisDLM_BY_styles.zip /app/styles/BasisDLM_BY_styles.zip
COPY styles/BasisDLM_BY_styles_transparent.zip /app/styles/BasisDLM_BY_styles_transparent.zip

COPY docker/entrypoint.sh /app/docker/entrypoint.sh

RUN chmod +x /app/docker/entrypoint.sh

ENTRYPOINT ["/app/docker/entrypoint.sh"]
FROM accetto/ubuntu-vnc-xfce-g3:24.04

USER 0

RUN \
    DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
        curl \
        openjdk-17-jre \
        dos2unix \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN chmod 666 /etc/passwd /etc/group

# Create necessary directories
RUN mkdir -p /app/presets /app/styles /home/headless/.config/JOSM /home/headless/.local/share/JOSM/plugins

# System content
COPY josm.jar /app/josm.jar
COPY icons/josm-bvv.png /app/icons/josm-bvv.png
COPY presets/BasisDLM_BY_presets.zip /app/presets/
COPY styles/BasisDLM_BY_styles.zip /app/styles/
COPY styles/BasisDLM_BY_styles_transparent.zip /app/styles/
COPY docker/.desktop /home/headless/Desktop/josm.desktop

COPY docker/entrypoint.sh /app/docker/entrypoint.sh
RUN dos2unix /app/docker/entrypoint.sh && chmod +x /app/docker/entrypoint.sh

# Change user
USER "${HEADLESS_USER_ID}"

# User content
COPY preferences.xml /home/headless/.config/JOSM/
COPY plugins/ /home/headless/.local/share/JOSM/plugins/

ENTRYPOINT ["/app/docker/entrypoint.sh"]

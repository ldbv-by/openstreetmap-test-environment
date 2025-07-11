FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

RUN apt-get update && \
    apt-get install -y \
            openjdk-17-jre \
            x11-apps \
            xauth \
            xserver-xorg-video-dummy \
    && rm -rf /var/lib/apt/lists/*

COPY josm.jar /opt/josm.jar

CMD [ "java", "--add-exports=java.base/sun.security.action=ALL-UNNAMED", "--add-exports=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED", "--add-exports=java.desktop/com.sun.imageio.spi=ALL-UNNAMED", "-jar", "/opt/josm.jar" ]
FROM dorowu/ubuntu-desktop-lxde-vnc

# Install Java Runtime
RUN apt-get update && \
    apt-get install -y openjdk-17-jre && \
    apt-get clean

# Copy josm.jar
COPY josm.jar /opt/josm.jar

# Run JOSM
ENTRYPOINT ["java", "-jar", "/opt/josm.jar"]

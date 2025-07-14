# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables
# - DEBIAN_FRONTEND=noninteractive prevents interactive prompts during package installation
# - DISPLAY=:0 sets the X11 display variable
# - JOSM_CONFIG_DIR=directory for JOSM config
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0
ENV JOSM_CONFIG_DIR=/root/.config/JOSM

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y \
            openjdk-17-jre \
            x11-apps \
            xauth \
            xserver-xorg-video-dummy \
    && rm -rf /var/lib/apt/lists/*

# Copy the JOSM application JAR file into the container
COPY josm.jar /opt/josm.jar

# Create necessary configuration directories for JOSM
RUN mkdir -p "$JOSM_CONFIG_DIR/styles"  \
             "$JOSM_CONFIG_DIR/presets"

# Copy JOSM preferences, styles and presets into the container
COPY preferences.xml $JOSM_CONFIG_DIR/
COPY styles/ $JOSM_CONFIG_DIR/styles/
COPY presets/ $JOSM_CONFIG_DIR/presets/

# Run JOSM with required JVM options
CMD [ "java", "--add-exports=java.base/sun.security.action=ALL-UNNAMED", "--add-exports=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED", "--add-exports=java.desktop/com.sun.imageio.spi=ALL-UNNAMED", "-jar", "/opt/josm.jar" ]
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    pulseaudio \
    pulseaudio-module-x11 \
    && rm -rf /var/lib/apt/lists/*

# Set up VNC server
RUN mkdir -p /root/.vnc
RUN echo "hozoo" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# Set up PulseAudio
RUN echo "default-server = unix:/run/user/$(id -u)/pulse/native" > /etc/pulse/client.conf

# Set up noVNC
RUN git clone https://github.com/novnc/noVNC.git /root/noVNC

# Set up entrypoint
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]

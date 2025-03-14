#!/bin/bash

# Start PulseAudio
pulseaudio --start

# Start VNC server
vncserver :1 -geometry 1280x720 -depth 24

# Start noVNC
cd /root/noVNC
./utils/launch.sh --vnc localhost:5901

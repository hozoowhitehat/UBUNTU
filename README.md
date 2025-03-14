


git clone https://github.com/hozoowhitehat/UBUNTU

cd UBUNTU

docker build -t custom-xfce-vnc-novnc .
docker run -d --name xfce \
  --shm-size="1gb" \
  -p 5900:5900 \
  -p 6081:6080 \
  -e VNC_PASSWD=hozoo \
  -e GEOMETRY=1280x720 \
  -e DEPTH=24 \
  -v /home/xfce/Downloads:/root/Downloads \
  -v /home/xfce/Documents:/root/Documents \
  -v /home/xfce/Pictures:/root/Pictures \
  -v /home/xfce/Videos:/root/Videos \
  -v /home/xfce/Music:/root/Music \
  --restart=unless-stopped \
  --privileged \
  --network host \
  -e PULSE_SERVER=unix:/run/user/$(id -u)/pulse/native \
  -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
  custom-xfce-vnc-novnc


  #RUN PROT 
  ____________________________________
  localhost:5901
  5900
  6081
  ____________________________________

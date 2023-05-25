podman build --format docker -t nginx .
podman run -d --name nginx nginx

#Showing list of exposed ports

podman inspect nginx| grep -i -A3 9090

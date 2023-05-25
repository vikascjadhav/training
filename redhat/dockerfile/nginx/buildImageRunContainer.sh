podman build --format docker -t my-httpd .
podman run -d --name my-httpd-container localhost/my-httpd

#Showing list of exposed ports

podman inspect nginx| grep -i -A3 8080

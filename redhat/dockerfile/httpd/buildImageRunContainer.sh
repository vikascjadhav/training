podman build --format docker -t my-httpd-child .  
podman run -d --name my-httpd-child -p 8080:8080 my-httpd-child
sleep 5
curl localhost:8080


FROM docker.io/bitnami/nginx

RUN pwd

COPY test /tmp/test
RUN cd /tmp/test && cat hello
RUN cd /tmp/test && pwd && ./runTest.sh
RUN pwd 
EXPOSE 9090/tcp
EXPOSE 9091/udp
ENTRYPOINT ["/opt/bitnami/scripts/nginx/entrypoint.sh"]
CMD ["/opt/bitnami/scripts/nginx/run.sh"]

FROM debian:stable-slim
LABEL name="demo-nginx"
LABEL version=1.0
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends nginx=1.6.2-5+deb8u4 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]

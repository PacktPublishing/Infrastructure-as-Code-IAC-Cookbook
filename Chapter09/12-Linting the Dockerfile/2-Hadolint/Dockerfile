FROM debian:stable-slim
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends apache2=2.4.10-10+deb8u7 \
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

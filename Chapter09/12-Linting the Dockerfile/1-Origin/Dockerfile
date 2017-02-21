FROM debian:stable-slim
RUN apt-get update -y \
    && apt-get install -y apache2 \
    && rm -rf /var/lib/apt
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

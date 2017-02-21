FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y apache2
RUN rm -rf /var/lib/apt
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

FROM alpine:latest
RUN apk add --update openssh-sftp-server openssh-client dropbear &&\
    rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear && touch /var/log/lastlog
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["dropbear", "-RFEmwg", "-p", "22"]

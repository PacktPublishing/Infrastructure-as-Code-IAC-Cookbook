FROM alpine:latest
ENV TERRAFORM_VERSION=0.7.12
VOLUME ["/data"]
WORKDIR /data
RUN apk --update --no-cache add ca-certificates openssl && \
  wget -O terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
  unzip terraform.zip -d /bin && \
  rm -rf terraform.zip /var/cache/apk/*
ENTRYPOINT ["/bin/terraform"]
CMD [ "--help" ]

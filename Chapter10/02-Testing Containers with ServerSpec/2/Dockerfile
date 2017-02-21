FROM debian:stable-slim
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends nginx=1.6.2-5+deb8u4 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

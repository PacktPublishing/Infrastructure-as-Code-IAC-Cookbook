FROM debian:jessie-slim
COPY src/hello/hello /usr/bin/hello
RUN chmod +x /usr/bin/hello
RUN groupadd -r hello && useradd -r -g hello hello
USER hello
EXPOSE 8000
ENTRYPOINT ["/usr/bin/hello"]

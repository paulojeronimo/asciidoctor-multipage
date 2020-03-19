FROM alpine:latest

ARG asciidoctor_version

# apk packages installation
RUN apk add --no-cache \
      ruby

# ruby packages installation
RUN gem install --no-document \
      asciidoctor:${asciidoctor_version} \
      thread_safe \
      coderay

# cleanup code
RUN gem cleanup && \
    rm -rf /tmp/* /var/cache/apk/*

WORKDIR /documents
VOLUME /documents

CMD ["/bin/sh"]

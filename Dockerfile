FROM alpine:latest

LABEL maintainer="Narvikd, originally made by Federico Cassano"
LABEL name="torsocks"

RUN apk update && apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN echo "Etc/UTC" >  /etc/timezone

RUN echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk -U upgrade && \
    apk -v add tor@edge curl && \
    rm -rf /var/cache/apk/*

# COPY torrc /etc/tor/

EXPOSE 9150

CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]

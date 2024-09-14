FROM alpine:latest

RUN set -ex \
    && apk add --no-cache rinetd --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    && sed -i -e 's|^logfile.*|logfile /proc/self/fd/1|g' /etc/rinetd.conf \
    && /usr/sbin/rinetd --version

ENTRYPOINT ["/usr/sbin/rinetd", "-f", "-c", "/etc/rinetd.conf"]

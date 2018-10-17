FROM debian:jessie

RUN set -xe \
    && apt-get install transmission-daemon

VOLUME ["/root/Downloads", "/etc/transmission-daemon"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-f", "--config-dir", "/etc/transmission-daemon", "--log-error"]

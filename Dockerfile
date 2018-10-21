FROM debian:stretch

RUN set -xe \
    && apt-get update \
    && apt-get install software-properties-common \
    && apt-add-repository non-free \
    && apt-get update \
    && apt-get install -y transmission-daemon unrar

VOLUME ["/root/Downloads", "/etc/transmission-daemon"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-f", "--config-dir", "/etc/transmission-daemon", "--log-error"]

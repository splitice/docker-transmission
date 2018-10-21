FROM debian:stretch

RUN set -xe \
    && apt-get update \
    && sed -i "s#deb http://http.us.debian.org/debian stretch main contrib non-free#deb http://http.us.debian.org/debian stretch main contrib non-free#g" /etc/apt/sources.list \
    && apt-get install -y transmission-daemon unrar

VOLUME ["/root/Downloads", "/etc/transmission-daemon"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-f", "--config-dir", "/etc/transmission-daemon", "--log-error"]

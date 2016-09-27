FROM debian:latest
MAINTAINER Pablo Morales, pablofmorales@gmail.com

ENV KONG_VERSION 0.9.2

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y netcat openssl libpcre3 dnsmasq procps perl sudo

RUN wget https://github.com/Mashape/kong/releases/download/$KONG_VERSION/kong-$KONG_VERSION.jessie_all.deb
RUN dpkg -i kong-$KONG_VERSION.jessie_all.deb


COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000 8443 8001 7946
CMD ["kong", "start"]

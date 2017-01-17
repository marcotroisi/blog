FROM debian:8
MAINTAINER Marco Troisi hello@marcotroisi.com

RUN apt-get update \
 && apt-get install -y wget

RUN cd ~ \
 && wget https://github.com/spf13/hugo/releases/download/v0.17/hugo_0.17-64bit.deb \
 && dpkg -i hugo*.deb 

RUN mkdir /website

WORKDIR /website
VOLUME ["/website"]

ENTRYPOINT ["hugo"]

FROM --platform=amd64 ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt upgrade -y
RUN apt install wine64 libwine winbind libstdc++6 xvfb -y
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt upgrade -y

# from https://github.com/steamcmd/docker/blob/master/dockerfiles/ubuntu-20/Dockerfile
# Insert Steam prompt answers
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
 && echo steam steam/license note '' | debconf-set-selections

RUN apt-get install steamcmd wine32 -y \
 && ln -s /usr/games/steamcmd /usr/bin/steamcmd

ENV WINEARCH=win64

EXPOSE 9876/udp
EXPOSE 9877/udp

RUN mkdir /scripts /server /data /tmp/settings
COPY ./scripts/* /scripts
COPY ./settings/* /tmp/settings

ENTRYPOINT [ "/scripts/server.sh" ]
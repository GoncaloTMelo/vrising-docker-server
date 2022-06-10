FROM fragsoc/steamcmd-wine-xvfb
USER root

RUN mkdir -p /apps /data /scripts /tmp/settings
COPY scripts/server.sh /scripts
ADD settings /tmp/settings


ENTRYPOINT []

EXPOSE 9876/udp
EXPOSE 9877/udp

CMD /scripts/server.sh

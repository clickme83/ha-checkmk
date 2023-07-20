FROM debian:bullseye
MAINTAINER Stefan Quarda

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends wget lsb-release apt-utils || true && \
  wget  https://download.checkmk.com/checkmk/2.2.0p6/check-mk-raw-2.2.0p6_0.bullseye_amd64.deb && \
  dpkg -i check-mk-raw-*.deb || true && \
  rm check-mk-raw-*.deb && \
  DEBIAN_FRONTEND=noninteractive apt-get install -f --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  DEBIAN_FRONTEND=noninteractive apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 5000/tcp
WORKDIR /app
COPY *.sh /app/
ENTRYPOINT ["/bin/bash"]
CMD ["/app/run.sh"]

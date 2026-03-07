FROM debian:trixie-slim

# tools
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
    git curl ca-certificates dnsutils \
    ripgrep fd-find && \
  ln -s /bin/fdfind /bin/fd && \
  rm -rf /var/lib/apt/lists/*

# pi-coding-agent
ARG VERSION=0.31.0
ARG CHECKSUM=sha256:309640a9970124e50d18dc81e2dae8c8d5af1cd5bd4a94de111fd93974590167
ADD --checksum=${CHECKSUM} https://github.com/badlogic/pi-mono/releases/download/v${VERSION}/pi-linux-x64.tar.gz /opt/

RUN mkdir /opt/pi-coding-agent && \
  tar xvf /opt/pi-linux-x64.tar.gz -C /opt/pi-coding-agent/ --strip-components=1 && \
  ln -s /opt/pi-coding-agent/pi /usr/bin/pi && \
  rm /opt/pi-linux-x64.tar.gz

ENV PI_SKIP_VERSION_CHECK=1

RUN mkdir /root/.pi
VOLUME [ "/root/.pi" ]

WORKDIR /root
ENTRYPOINT ["/usr/bin/pi"]

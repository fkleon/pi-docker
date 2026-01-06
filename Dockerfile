FROM debian:trixie-slim

# app user
ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# tools
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git curl ca-certificates && \
  rm -rf /var/lib/apt/lists/*

# pi-coding-agent
ARG VERSION=0.31.0
ARG CHECKSUM=sha256:309640a9970124e50d18dc81e2dae8c8d5af1cd5bd4a94de111fd93974590167
ADD --checksum=${CHECKSUM} https://github.com/badlogic/pi-mono/releases/download/v${VERSION}/pi-linux-x64.tar.gz /opt/

RUN mkdir /opt/pi-coding-agent && \
  tar xvf /opt/pi-linux-x64.tar.gz -C /opt/pi-coding-agent/ && \
  ln -s /opt/pi-coding-agent/pi /usr/bin/pi && \
  rm /opt/pi-linux-x64.tar.gz

USER $USERNAME

RUN mkdir /home/${USERNAME}/.pi
VOLUME [ "/home/${USERNAME}/.pi" ]

WORKDIR /home/${USERNAME}
ENTRYPOINT ["/usr/bin/pi"]

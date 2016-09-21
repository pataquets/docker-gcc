FROM gcc

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      apt-transport-https netcat \
      netcat-traditional \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Use a local APT caching proxy, if available
ADD ./files/etc/apt/ /etc/apt/

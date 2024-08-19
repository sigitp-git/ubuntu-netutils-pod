FROM ubuntu:jammy
 RUN apt-get update && \
     apt-get install -y net-tools \
     tcpdump \
     vim \
     iperf3 \
     iftop \
     ethtool \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*
 RUN apt-get update && \
     apt-get install -y netcat \
     iputils-ping \
     wget \
     curl \
     iproute2 \
     dnsutils \
     telnet \
     git
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*
 RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash
 RUN apt-get update
 RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk
 WORKDIR /src
 COPY . .

FROM ubuntu:jammy
 RUN apt-get clean && \
     rm -rf /var/lib/apt/lists/*
 RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash
 RUN apt-get update
 RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk
 WORKDIR /src
 COPY . .

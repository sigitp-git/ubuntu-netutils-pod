# ubuntu-netutils-pod
Dockerfile and Pod definition for network utility tools on Ubuntu, useful for network and throughput testing on your Kubernetes cluster
Packages:
- net-tools
- tcpdump
- vim
- iperf3
- iftop
- ethtool
- netcat
- iputils-ping
- wget
- curl
- iproute2
- dnsutils
- telnet
- git
- vpp

### building ubuntu-netutils container image for both amd64 and arm64, and upload it to AWS ECR, change 01234567890 to your AWS account ID
```
aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 01234567890.dkr.ecr.us-east-1.amazonaws.com
sudo docker buildx build --platform linux/amd64,linux/arm64 -t 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-netutils --push .
```

example build output:
```
Admin:~/environment/ubuntu-netutils-dockerfile $ sudo docker buildx build --platform linux/amd64,linux/arm64 -t 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-netutils --push .
[+] Building 324.4s (22/22) FINISHED                                                                                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                     0.0s
 => => transferring dockerfile: 397B                                                                                                                                                     0.0s
 => [linux/arm64 internal] load metadata for docker.io/library/ubuntu:jammy                                                                                                              0.7s
 => [linux/amd64 internal] load metadata for docker.io/library/ubuntu:jammy                                                                                                              0.7s
 => [internal] load .dockerignore                                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                                          0.0s
 => [linux/amd64 1/7] FROM docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                                        2.5s
 => => resolve docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                                                    0.0s
 => => sha256:857cc8cb19c0f475256df4b7709003b77f101215ebf3693118e61aac6a5ea4ff 29.54MB / 29.54MB                                                                                         0.6s
 => => extracting sha256:857cc8cb19c0f475256df4b7709003b77f101215ebf3693118e61aac6a5ea4ff                                                                                                1.8s
 => [internal] load build context                                                                                                                                                        0.0s
 => => transferring context: 397B                                                                                                                                                        0.0s
 => [linux/arm64 1/7] FROM docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                                        2.4s
 => => resolve docker.io/library/ubuntu:jammy@sha256:adbb90115a21969d2fe6fa7f9af4253e16d45f8d4c1e930182610c4731962658                                                                    0.0s
 => => sha256:e63ce922f0229bde5aea9f366c46883dcd23747e7d2c541f16665f199dbf98b8 27.36MB / 27.36MB                                                                                         0.7s
 => => extracting sha256:e63ce922f0229bde5aea9f366c46883dcd23747e7d2c541f16665f199dbf98b8                                                                                                1.6s
 => [linux/arm64 2/7] RUN apt-get update && apt-get install -y net-tools tcpdump vim iperf3 iftop ethtool netcat iputils-ping wget curl iproute2 dnsutils telnet git                   172.0s
 => [linux/amd64 2/7] RUN apt-get update && apt-get install -y net-tools tcpdump vim iperf3 iftop ethtool netcat iputils-ping wget curl iproute2 dnsutils telnet git                    15.6s
 => [linux/amd64 3/7] RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash                                                                        15.8s 
 => [linux/amd64 4/7] RUN apt-get update                                                                                                                                                 2.0s 
 => [linux/amd64 5/7] RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk                                                                                                         3.9s 
 => [linux/amd64 6/7] WORKDIR /src                                                                                                                                                       0.0s 
 => [linux/amd64 7/7] COPY . .                                                                                                                                                           0.0s 
 => [linux/arm64 3/7] RUN curl -s https://packagecloud.io/install/repositories/fdio/release/script.deb.sh | bash                                                                        75.7s 
 => [linux/arm64 4/7] RUN apt-get update                                                                                                                                                18.1s 
 => [linux/arm64 5/7] RUN apt-get install -y vpp vpp-plugin-core vpp-plugin-dpdk                                                                                                        20.8s 
 => [linux/arm64 6/7] WORKDIR /src                                                                                                                                                       0.1s 
 => [linux/arm64 7/7] COPY . .                                                                                                                                                           0.0s 
 => exporting to image                                                                                                                                                                  33.5s 
 => => exporting layers                                                                                                                                                                 21.9s 
 => => exporting manifest sha256:0eb24efda6630436ebb85dff44ffa1bbf0c1bb0bd631849bf69f85f81c86b320                                                                                        0.0s 
 => => exporting config sha256:15b0d17810626c7e2a701e06b2c80ae78f1243b22fe6cdc0c6f0aa4a393a3d2f                                                                                          0.0s 
 => => exporting attestation manifest sha256:e38dce54ae2e6c951eed8690781035b8a671642011965a8ace93da44a6471b9a                                                                            0.0s
 => => exporting manifest sha256:f0a56a63552e2e345d2c0832dfc10abd3b49acd78c3a7d19da9ebf7844c6e917                                                                                        0.0s
 => => exporting config sha256:682a3e48b42ca17db2af18d2a32026de3eda0590956d83997954a74163522f0c                                                                                          0.0s
 => => exporting attestation manifest sha256:cdc96e5c1e3e153fe57fb21426f5d8155d72d900ad4ea4c34a0e70c94fb401a0                                                                            0.0s
 => => exporting manifest list sha256:1273d7525ff77623e110aeaf82c810edb5f39babb683ebbad6ec5aa3696c95a7                                                                                   0.0s
 => => naming to 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-netutils                                                                                                 0.0s
 => => unpacking to 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-netutils                                                                                              3.6s
 => => pushing layers                                                                                                                                                                    6.3s
 => => pushing manifest for 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-netutils@sha256:1273d7525ff77623e110aeaf82c810edb5f39babb683ebbad6ec5aa3696c95a7              1.6s
 => [auth] sharing credentials for 01234567890.dkr.ecr.us-east-1.amazonaws.com                                                                                                          0.0s
 => pushing 01234567890.dkr.ecr.us-east-1.amazonaws.com/sigitp-ecr:ubuntu-netutils with docker                                                                                          0.7s
 => => pushing layer 54146c695a3b                                                                                                                                                        0.6s
 => => pushing layer 3cd304903ebb                                                                                                                                                        0.6s
 => => pushing layer 4f4fb700ef54                                                                                                                                                        0.6s
 => => pushing layer e63ce922f022                                                                                                                                                        0.6s
 => => pushing layer 328d38a532e6                                                                                                                                                        0.6s
 => => pushing layer e35da54da1be                                                                                                                                                        0.6s
 => => pushing layer 5b9ea22bd7d9                                                                                                                                                        0.6s
 => => pushing layer 857cc8cb19c0                                                                                                                                                        0.6s
 => => pushing layer f043f0a560f6                                                                                                                                                        0.6s
 => => pushing layer c272e452a53c                                                                                                                                                        0.6s
 => => pushing layer cbe28a07e910                                                                                                                                                        0.6s
 => => pushing layer e7b3de6f9e3b                                                                                                                                                        0.6s
 => => pushing layer 7759491d8589                                                                                                                                                        0.6s
 => => pushing layer 2a212c544622                                                                                                                                                        0.6s
Admin:~/environment/ubuntu-netutils-dockerfile $ 
```

### example pod definition


### iperf3: create server and client pods
```
Admin:~/environment $ kubectl apply -f iperf3-client-pod.yaml
Admin:~/environment $ kubectl apply -f iperf3-server-pod.yaml

Admin:~/environment $ kubectl get po -o wide
NAME                                READY   STATUS    RESTARTS       AGE     IP               NODE                             NOMINATED NODE   READINESS GATES
iperf3-client-pod                          1/1     Running   0              9m44s   172.31.148.220   ip-172-31-152-24.ec2.internal    <none>           <none>
iperf3-server-pod                          1/1     Running   0              6m36s   172.31.150.90    ip-172-31-148-193.ec2.internal   <none>           <none>
Admin:~/environment $ 
```

### iperf3: execute the iperf3 server, port 5201
```
Admin:~/environment $ kubectl exec -it iperf3-server-pod -- bash
root@iperf3-pod:/# iperf3 -s -p 5201
-----------------------------------------------------------
Server listening on 5201
-----------------------------------------------------------

```

### iperf3: using iperf3 client
```
Admin:~/environment $ kubectl exec -it iperf3-client-pod -- bash
root@iperf3-pod2:/# iperf3 -c 172.31.148.220 -p 5201
Connecting to host 172.31.148.220, port 5201
[  5] local 172.31.150.90 port 55976 connected to 172.31.148.220 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   1.00-2.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   2.00-3.00   sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
[  5]   3.00-4.00   sec   591 MBytes  4.96 Gbits/sec    4   3.16 MBytes       
[  5]   4.00-5.00   sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
[  5]   5.00-6.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   6.00-7.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   7.00-8.00   sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
[  5]   8.00-9.00   sec   591 MBytes  4.96 Gbits/sec    0   3.16 MBytes       
[  5]   9.00-10.00  sec   592 MBytes  4.97 Gbits/sec    0   3.16 MBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  5.78 GBytes  4.96 Gbits/sec    4             sender
[  5]   0.00-10.04  sec  5.78 GBytes  4.94 Gbits/sec                  receiver

iperf Done.

root@iperf3-pod2:/# iperf3 -R -c 172.31.148.220 -p 5201                                                                                                               
Connecting to host 172.31.148.220, port 5201
Reverse mode, remote host 172.31.148.220 is sending
[  5] local 172.31.150.90 port 59256 connected to 172.31.148.220 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   593 MBytes  4.97 Gbits/sec                  
[  5]   1.00-2.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   2.00-3.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   3.00-4.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   4.00-5.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   5.00-6.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   6.00-7.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   7.00-8.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   8.00-9.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5]   9.00-10.00  sec   592 MBytes  4.96 Gbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.04  sec  5.78 GBytes  4.95 Gbits/sec    1             sender
[  5]   0.00-10.00  sec  5.78 GBytes  4.97 Gbits/sec                  receiver

iperf Done.

root@iperf3-pod2:/# iperf3 --bidir -c 172.31.148.220 -p 5201                                                                                                          
Connecting to host 172.31.148.220, port 5201
[  5] local 172.31.150.90 port 47372 connected to 172.31.148.220 port 5201
[  7] local 172.31.150.90 port 47388 connected to 172.31.148.220 port 5201
[ ID][Role] Interval           Transfer     Bitrate         Retr  Cwnd
[  5][TX-C]   0.00-1.00   sec   596 MBytes  5.00 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   0.00-1.00   sec   592 MBytes  4.97 Gbits/sec                  
[  5][TX-C]   1.00-2.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   1.00-2.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   2.00-3.00   sec   592 MBytes  4.97 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   2.00-3.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   3.00-4.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   3.00-4.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   4.00-5.00   sec   592 MBytes  4.97 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   4.00-5.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   5.00-6.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   5.00-6.00   sec   576 MBytes  4.84 Gbits/sec                  
[  5][TX-C]   6.00-7.00   sec   588 MBytes  4.93 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   6.00-7.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   7.00-8.00   sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   7.00-8.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   8.00-9.00   sec   592 MBytes  4.97 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   8.00-9.00   sec   592 MBytes  4.96 Gbits/sec                  
[  5][TX-C]   9.00-10.00  sec   591 MBytes  4.96 Gbits/sec    0   3.17 MBytes       
[  7][RX-C]   9.00-10.00  sec   592 MBytes  4.96 Gbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID][Role] Interval           Transfer     Bitrate         Retr
[  5][TX-C]   0.00-10.00  sec  5.78 GBytes  4.96 Gbits/sec    0             sender
[  5][TX-C]   0.00-10.04  sec  5.78 GBytes  4.94 Gbits/sec                  receiver
[  7][RX-C]   0.00-10.00  sec  5.77 GBytes  4.95 Gbits/sec  140             sender
[  7][RX-C]   0.00-10.04  sec  5.76 GBytes  4.93 Gbits/sec                  receiver

iperf Done.

root@iperf3-pod2:/# iperf3 -c 172.31.148.220 -t 60 -P 32
Connecting to host 172.31.148.220, port 5201
[  5] local 172.31.150.90 port 39056 connected to 172.31.148.220 port 5201
[  7] local 172.31.150.90 port 39058 connected to 172.31.148.220 port 5201
[  9] local 172.31.150.90 port 39074 connected to 172.31.148.220 port 5201
[ 11] local 172.31.150.90 port 39088 connected to 172.31.148.220 port 5201
[ 13] local 172.31.150.90 port 39102 connected to 172.31.148.220 port 5201
[ 15] local 172.31.150.90 port 39110 connected to 172.31.148.220 port 5201
[ 17] local 172.31.150.90 port 39126 connected to 172.31.148.220 port 5201
[ 19] local 172.31.150.90 port 39142 connected to 172.31.148.220 port 5201
[ 21] local 172.31.150.90 port 39154 connected to 172.31.148.220 port 5201
[ 23] local 172.31.150.90 port 39156 connected to 172.31.148.220 port 5201
[ 25] local 172.31.150.90 port 39172 connected to 172.31.148.220 port 5201
[ 27] local 172.31.150.90 port 39184 connected to 172.31.148.220 port 5201
[ 29] local 172.31.150.90 port 39186 connected to 172.31.148.220 port 5201
[ 31] local 172.31.150.90 port 39190 connected to 172.31.148.220 port 5201
[ 33] local 172.31.150.90 port 39198 connected to 172.31.148.220 port 5201
[ 35] local 172.31.150.90 port 39214 connected to 172.31.148.220 port 5201
[ 37] local 172.31.150.90 port 39226 connected to 172.31.148.220 port 5201
[ 39] local 172.31.150.90 port 39232 connected to 172.31.148.220 port 5201
[ 41] local 172.31.150.90 port 39236 connected to 172.31.148.220 port 5201
[ 43] local 172.31.150.90 port 39244 connected to 172.31.148.220 port 5201
[ 45] local 172.31.150.90 port 39260 connected to 172.31.148.220 port 5201
[ 47] local 172.31.150.90 port 39276 connected to 172.31.148.220 port 5201
[ 49] local 172.31.150.90 port 39282 connected to 172.31.148.220 port 5201
[ 51] local 172.31.150.90 port 39286 connected to 172.31.148.220 port 5201
[ 53] local 172.31.150.90 port 39292 connected to 172.31.148.220 port 5201
[ 55] local 172.31.150.90 port 39296 connected to 172.31.148.220 port 5201
[ 57] local 172.31.150.90 port 39308 connected to 172.31.148.220 port 5201
[ 59] local 172.31.150.90 port 39316 connected to 172.31.148.220 port 5201
[ 61] local 172.31.150.90 port 39320 connected to 172.31.148.220 port 5201
[ 63] local 172.31.150.90 port 39328 connected to 172.31.148.220 port 5201
[ 65] local 172.31.150.90 port 39342 connected to 172.31.148.220 port 5201
[ 67] local 172.31.150.90 port 39344 connected to 172.31.148.220 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  22.0 MBytes   185 Mbits/sec   18    184 KBytes       
[  7]   0.00-1.00   sec  42.0 MBytes   352 Mbits/sec   10    472 KBytes       
[  9]   0.00-1.00   sec  48.0 MBytes   403 Mbits/sec   15    376 KBytes       
[ 11]   0.00-1.00   sec  26.0 MBytes   218 Mbits/sec   12    332 KBytes       
[ 13]   0.00-1.00   sec  87.1 MBytes   730 Mbits/sec   33    306 KBytes       
[ 15]   0.00-1.00   sec  56.6 MBytes   475 Mbits/sec   22    288 KBytes       
[ 17]   0.00-1.00   sec  44.7 MBytes   375 Mbits/sec   23    280 KBytes       
[ 19]   0.00-1.00   sec  38.8 MBytes   326 Mbits/sec   16    175 KBytes       
[ 21]   0.00-1.00   sec  22.3 MBytes   187 Mbits/sec    7    332 KBytes       
[ 23]   0.00-1.00   sec  99.2 MBytes   832 Mbits/sec   65    542 KBytes       
[ 25]   0.00-1.00   sec  38.2 MBytes   320 Mbits/sec   18    218 KBytes       
[ 27]   0.00-1.00   sec   105 MBytes   879 Mbits/sec   54    297 KBytes       
[ 29]   0.00-1.00   sec  31.6 MBytes   265 Mbits/sec   12    297 KBytes       
[ 31]   0.00-1.00   sec  28.3 MBytes   238 Mbits/sec    4    463 KBytes       
[ 33]   0.00-1.00   sec  22.3 MBytes   187 Mbits/sec   11    280 KBytes       
[ 35]   0.00-1.00   sec  38.6 MBytes   324 Mbits/sec   11    411 KBytes       
[ 37]   0.00-1.00   sec  33.0 MBytes   277 Mbits/sec    6    393 KBytes       
[ 39]   0.00-1.00   sec  52.4 MBytes   439 Mbits/sec   30    306 KBytes       
[ 41]   0.00-1.00   sec  22.6 MBytes   190 Mbits/sec   10    201 KBytes       
[ 43]   0.00-1.00   sec  19.3 MBytes   162 Mbits/sec   10    280 KBytes       
[ 45]   0.00-1.00   sec  59.8 MBytes   501 Mbits/sec   12    385 KBytes       
[ 47]   0.00-1.00   sec  20.7 MBytes   173 Mbits/sec   10    332 KBytes       
[ 49]   0.00-1.00   sec  91.6 MBytes   768 Mbits/sec   36    332 KBytes       
[ 51]   0.00-1.00   sec   189 MBytes  1.59 Gbits/sec  129    350 KBytes       
[ 53]   0.00-1.00   sec  45.5 MBytes   381 Mbits/sec   20    341 KBytes       
[ 55]   0.00-1.00   sec  26.8 MBytes   225 Mbits/sec    3    498 KBytes       
[ 57]   0.00-1.00   sec  30.0 MBytes   252 Mbits/sec    5    315 KBytes       
[ 59]   0.00-1.00   sec  28.9 MBytes   243 Mbits/sec   21    376 KBytes       
[ 61]   0.00-1.00   sec  23.5 MBytes   197 Mbits/sec   18    184 KBytes       
[ 63]   0.00-1.00   sec  35.7 MBytes   300 Mbits/sec   13    245 KBytes       
[ 65]   0.00-1.00   sec  64.5 MBytes   541 Mbits/sec   15    542 KBytes       
[ 67]   0.00-1.00   sec  43.7 MBytes   367 Mbits/sec   15    271 KBytes       
[SUM]   0.00-1.00   sec  1.50 GBytes  12.9 Gbits/sec  684     

- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-60.00  sec  2.28 GBytes   326 Mbits/sec  676             sender
[  5]   0.00-60.05  sec  2.27 GBytes   325 Mbits/sec                  receiver
[  7]   0.00-60.00  sec  2.02 GBytes   289 Mbits/sec  795             sender
[  7]   0.00-60.05  sec  2.02 GBytes   289 Mbits/sec                  receiver
[  9]   0.00-60.00  sec  1.83 GBytes   262 Mbits/sec  586             sender
[  9]   0.00-60.05  sec  1.83 GBytes   262 Mbits/sec                  receiver
[ 11]   0.00-60.00  sec  2.24 GBytes   321 Mbits/sec  693             sender
[ 11]   0.00-60.05  sec  2.24 GBytes   320 Mbits/sec                  receiver
[ 13]   0.00-60.00  sec  2.19 GBytes   313 Mbits/sec  683             sender
[ 13]   0.00-60.05  sec  2.18 GBytes   312 Mbits/sec                  receiver
[ 15]   0.00-60.00  sec  3.67 GBytes   525 Mbits/sec  1225             sender
[ 15]   0.00-60.05  sec  3.67 GBytes   525 Mbits/sec                  receiver
[ 17]   0.00-60.00  sec  3.65 GBytes   522 Mbits/sec  1303             sender
[ 17]   0.00-60.05  sec  3.64 GBytes   521 Mbits/sec                  receiver
[ 19]   0.00-60.00  sec  1.66 GBytes   238 Mbits/sec  616             sender
[ 19]   0.00-60.05  sec  1.66 GBytes   238 Mbits/sec                  receiver
[ 21]   0.00-60.00  sec  3.67 GBytes   525 Mbits/sec  1253             sender
[ 21]   0.00-60.05  sec  3.66 GBytes   524 Mbits/sec                  receiver
[ 23]   0.00-60.00  sec  1.79 GBytes   256 Mbits/sec  603             sender
[ 23]   0.00-60.05  sec  1.78 GBytes   255 Mbits/sec                  receiver
[ 25]   0.00-60.00  sec  1.76 GBytes   252 Mbits/sec  573             sender
[ 25]   0.00-60.05  sec  1.76 GBytes   251 Mbits/sec                  receiver
[ 27]   0.00-60.00  sec  1.69 GBytes   242 Mbits/sec  583             sender
[ 27]   0.00-60.05  sec  1.69 GBytes   242 Mbits/sec                  receiver
[ 29]   0.00-60.00  sec  1.81 GBytes   259 Mbits/sec  620             sender
[ 29]   0.00-60.05  sec  1.81 GBytes   259 Mbits/sec                  receiver
[ 31]   0.00-60.00  sec  1.73 GBytes   248 Mbits/sec  647             sender
[ 31]   0.00-60.05  sec  1.73 GBytes   248 Mbits/sec                  receiver
[ 33]   0.00-60.00  sec  3.67 GBytes   525 Mbits/sec  1223             sender
[ 33]   0.00-60.05  sec  3.66 GBytes   524 Mbits/sec                  receiver
[ 35]   0.00-60.00  sec  2.16 GBytes   310 Mbits/sec  699             sender
[ 35]   0.00-60.05  sec  2.16 GBytes   309 Mbits/sec                  receiver
[ 37]   0.00-60.00  sec  2.32 GBytes   332 Mbits/sec  655             sender
[ 37]   0.00-60.05  sec  2.32 GBytes   332 Mbits/sec                  receiver
[ 39]   0.00-60.00  sec  2.13 GBytes   305 Mbits/sec  790             sender
[ 39]   0.00-60.05  sec  2.13 GBytes   305 Mbits/sec                  receiver
[ 41]   0.00-60.00  sec  1.81 GBytes   258 Mbits/sec  589             sender
[ 41]   0.00-60.05  sec  1.80 GBytes   258 Mbits/sec                  receiver
[ 43]   0.00-60.00  sec  10.9 GBytes  1.56 Gbits/sec  4177             sender
[ 43]   0.00-60.05  sec  10.9 GBytes  1.56 Gbits/sec                  receiver
[ 45]   0.00-60.00  sec  3.57 GBytes   511 Mbits/sec  1316             sender
[ 45]   0.00-60.05  sec  3.57 GBytes   510 Mbits/sec                  receiver
[ 47]   0.00-60.00  sec  3.66 GBytes   523 Mbits/sec  1343             sender
[ 47]   0.00-60.05  sec  3.66 GBytes   523 Mbits/sec                  receiver
[ 49]   0.00-60.00  sec  3.59 GBytes   515 Mbits/sec  1313             sender
[ 49]   0.00-60.05  sec  3.59 GBytes   514 Mbits/sec                  receiver
[ 51]   0.00-60.00  sec  1.74 GBytes   249 Mbits/sec  566             sender
[ 51]   0.00-60.05  sec  1.74 GBytes   249 Mbits/sec                  receiver
[ 53]   0.00-60.00  sec  1.77 GBytes   253 Mbits/sec  557             sender
[ 53]   0.00-60.05  sec  1.77 GBytes   253 Mbits/sec                  receiver
[ 55]   0.00-60.00  sec  3.66 GBytes   524 Mbits/sec  1212             sender
[ 55]   0.00-60.05  sec  3.66 GBytes   524 Mbits/sec                  receiver
[ 57]   0.00-60.00  sec  1.96 GBytes   281 Mbits/sec  622             sender
[ 57]   0.00-60.05  sec  1.96 GBytes   280 Mbits/sec                  receiver
[ 59]   0.00-60.00  sec  3.64 GBytes   521 Mbits/sec  1327             sender
[ 59]   0.00-60.05  sec  3.64 GBytes   521 Mbits/sec                  receiver
[ 61]   0.00-60.00  sec  2.15 GBytes   308 Mbits/sec  677             sender
[ 61]   0.00-60.05  sec  2.15 GBytes   308 Mbits/sec                  receiver
[ 63]   0.00-60.00  sec  1.74 GBytes   249 Mbits/sec  555             sender
[ 63]   0.00-60.05  sec  1.74 GBytes   249 Mbits/sec                  receiver
[ 65]   0.00-60.00  sec  2.14 GBytes   307 Mbits/sec  784             sender
[ 65]   0.00-60.05  sec  2.14 GBytes   306 Mbits/sec                  receiver
[ 67]   0.00-60.00  sec  2.13 GBytes   306 Mbits/sec  785             sender
[ 67]   0.00-60.05  sec  2.13 GBytes   305 Mbits/sec                  receiver
[SUM]   0.00-60.00  sec  86.7 GBytes  12.4 Gbits/sec  30046             sender
[SUM]   0.00-60.05  sec  86.7 GBytes  12.4 Gbits/sec                  receiver

iperf Done.
root@iperf3-pod2:/# 
```


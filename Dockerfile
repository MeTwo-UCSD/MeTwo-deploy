FROM debian:jessie-slim

WORKDIR /root

ENV PATH $PATH:/usr/local/bin

RUN apt-get update && \ 
    apt-get install -y cmake git xz-utils wget 

RUN wget https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-linux-gnu/gcc-linaro-7.1.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz && \
    tar -xf *.tar.xz --strip 1 -C /usr/local/
    
COPY deploy/* /root/deploy/
RUN bash /root/deploy/build.sh
RUN tar -cJf toolchain.tar.xz output

COPY deploy/* /root/deploy/
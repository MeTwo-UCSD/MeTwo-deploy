FROM debian:jessie-slim

WORKDIR /root

ENV TOOLCHAIN aarch64-unknown-linux-gnueabi

RUN apt-get update && \ 
    apt-get install -y wget cmake bzip2

RUN wget https://github.com/smallzzy/metwo-cc/releases/download/v1.0.1/$TOOLCHAIN.tar.bz2 && \
    mkdir $TOOLCHAIN && \
    tar -xf $TOOLCHAIN.tar.* -C $TOOLCHAIN 
    
ENV PATH $PATH:/root/$TOOLCHAIN/bin

COPY deploy/* deploy/

RUN bash /root/deploy/deploy.sh -D CMAKE_C_COMPILER=${TOOLCHAIN}-gcc -D CMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}-g++
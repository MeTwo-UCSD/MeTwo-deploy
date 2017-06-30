FROM debian:jessie-slim

WORKDIR /root

ENV TOOLCHAIN aarch64-unknown-linux-gnueabi
ENV PATH $PATH:/root/$TOOLCHAIN/bin

RUN apt-get update && \ 
    apt-get install -y bzip2 cmake git wget

RUN wget https://github.com/smallzzy/metwo-cc/releases/download/v1.0.1/$TOOLCHAIN.tar.bz2 && \
#COPY $TOOLCHAIN.tar.bz2 /root/

RUN tar -xf $TOOLCHAIN.tar.*
    
COPY deploy/* /root/deploy/

RUN bash /root/deploy/deploy.sh -D CMAKE_C_COMPILER=$(command -v ${TOOLCHAIN}-gcc) -D CMAKE_CXX_COMPILER=$(command -v ${TOOLCHAIN}-g++)


FROM debian:jessie-slim

WORKDIR /root

RUN apt-get update && \ 
    apt-get install -y git build-essential swig3.0 python-dev nodejs-dev cmake libjson-c-dev
    

COPY *.tar.* /root/ 

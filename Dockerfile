FROM ubuntu:18.04
MAINTAINER Lucas Theis

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y git
RUN apt-get install -y libjpeg-dev libpng-dev
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y libopenblas-base

RUN apt-get install -y autoconf automake libtool

COPY requirements.txt /tmp/
WORKDIR /tmp

RUN pip3 install -r requirements.txt

RUN git clone https://github.com/lucastheis/cmt
RUN \
	cd cmt/code/liblbfgs && \
	./autogen.sh && \
	./configure --enable-sse2 && \
	make CFLAGS="-fPIC"
RUN \
	cd cmt && \
	python2 setup.py build && \
	python2 setup.py install

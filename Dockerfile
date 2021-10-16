FROM ubuntu:21.04

MAINTAINER zrn-ns

RUN apt-get update

# 日本語環境化
RUN apt-get install -y language-pack-ja-base language-pack-ja locales tzdata; \
    locale-gen ja_JP.UTF-8
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8

# Install ffmpeg
RUN apt-get install -y build-essential git wget libasound2-dev \
      autoconf libtool pcsc-tools pkg-config libpcsclite-dev pcscd \
      cmake yasm curl ssh dkms unzip vim -y -qq --no-install-recommends

RUN mkdir /usr/src/ffmpeg && \
    cd /usr/src/ffmpeg && \
    wget http://ffmpeg.org/releases/ffmpeg-4.4.tar.gz && \
    tar zxvf ffmpeg-4.4.tar.gz && \
    cd ffmpeg-4.4 && \
    ./configure && \
    make -j$(nproc) && \
    make install

CMD ["/bin/bash"]

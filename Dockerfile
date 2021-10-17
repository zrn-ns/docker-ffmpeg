FROM arm32v7/ubuntu:21.04

MAINTAINER zrn-ns

RUN apt-get update

# 日本語環境化
RUN apt-get install -y language-pack-ja-base language-pack-ja locales tzdata; \
    locale-gen ja_JP.UTF-8
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8

# wget, xzをインストール
RUN apt-get install wget xz-utils -y -qq --no-install-recommends

# Install ffmpeg
RUN mkdir /usr/src/ffmpeg && \
    cd /usr/src/ffmpeg && \
    wget --no-check-certificate "https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-armel-static.tar.xz" && \
    tar -Jxvf ffmpeg-release-armel-static.tar.xz && \
    cd ffmpeg-* && \
    cp ffmpeg /usr/local/bin/

CMD ["/bin/bash"]

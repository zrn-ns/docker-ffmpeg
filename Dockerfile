FROM ubuntu:18.04

MAINTAINER zrn-ns

RUN apt-get update

# add repository(streamlink)
RUN apt-get install software-properties-common -y -qq --no-install-recommends
RUN add-apt-repository ppa:nilarimogard/webupd8

# 日本語環境化
RUN apt-get install -y language-pack-ja-base language-pack-ja locales tzdata; \
    locale-gen ja_JP.UTF-8
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8

# Install ffmpeg, vim
RUN apt-get install ffmpeg -y -qq --no-install-recommends

# Install other tools
RUN apt-get install vim -y -qq --no-install-recommends

CMD ["/bin/bash"]

FROM ubuntu:bionic
MAINTAINER sairuk
ARG USER=emudev
ARG UID=1004
ARG BS=build-script
ARG BSD=/tmp/${BS}

# REFERENCES
# https://wiki.qt.io/Install_Qt_5_on_Ubuntu
# https://github.com/jpd002/Play-

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install \
      git \
      cmake \
      build-essential \
      mesa-common-dev \
      libglu1-mesa-dev \
      libfontconfig1 \
      libalut-dev \
      libevdev-dev \
      libsqlite3-dev \
      libglew-dev \
      libbz2-dev \
      zlib1g-dev \
      libssl-dev \
      libcurl4-openssl-dev \
      libicu-dev \
      qt5-default


RUN useradd -m -s /bin/bash -u ${UID} ${USER}

COPY ${BS} ${BSD}

RUN chown ${USER}: ${BSD} \
    && chmod +x ${BSD}

VOLUME /home/${USER}
USER ${USER}
WORKDIR /home/${USER}

CMD /tmp/build-script


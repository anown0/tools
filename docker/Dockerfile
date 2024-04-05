# comment

# The "FROM" instruction is required at the start of the file
FROM ubuntu:22.04

LABEL maintainer="mark@anown.net"
LABEL version="0.1"
LABEL description="This is a custom Docker Image"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
COPY bash_profile /root/.bash_profile

RUN apt-get update -y; \
    apt-get upgrade -y;
RUN apt-get install -y \
vim \
curl \
git \
build-essential \
libssl-dev \
zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev \
libxmlsec1-dev libffi-dev liblzma-dev

RUN curl https://pyenv.run | bash
RUN /bin/bash -c "source /root/.bash_profile && pyenv install 3.12 && pyenv global 3.12"

# This is a copy from the build directory on the host, to the docker imageJ

# bitbar/ubunopy
#
# VERSION 1.0.0

# based on Ubuntu 18.04 LTS
FROM ubuntu:bionic

LABEL vendor="Bitbar Inc" \
      description="Ubuntu LTS based Docker image with Node.js and Python inside."

ENV TERM=xterm-256color \
    PATH="$PATH:/usr/local/bin"

# set timezone
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# installing apt packages
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -qy -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    build-essential gcc \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    tree \
    git \
    curl \
    wget \
    tzdata \
    python3 python3-pip

# install Node.js 10.x LTS
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install nodejs -y && \
    rm nodesource_setup.sh

# confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# bitbar/ubunopy

FROM bitbar/ubuno:3.0.0

LABEL vendor="Bitbar Inc" \
      description="Ubuntu LTS based Docker image with Node.js and Python inside."

# installing apt packages
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt install -y python2
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python2 get-pip.py
RUN apt-get update && apt-get install -y libssl-dev zlib1g-dev && \
    mkdir python3 && \
    cd python3 && \
    wget https://www.python.org/ftp/python/3.8.14/Python-3.8.14.tar.xz && \
    tar -xf Python-3.8.14.tar.xz && \
    cd Python-3.8.14 && \
    ./configure && make && make install && \
    cd ../../ && rm -r python3
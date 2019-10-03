# bitbar/ubunopy

FROM bitbar/ubuno:1.0.0

LABEL vendor="Bitbar Inc" \
      description="Ubuntu LTS based Docker image with Node.js and Python inside."

# installing apt packages
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -qy \
    -o APT::Install-Recommend=false \
    -o APT::Install-Suggests=false \
    --fix-missing \
    python python-pip \
    python3 python3-pip

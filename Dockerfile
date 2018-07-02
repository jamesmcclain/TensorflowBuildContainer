FROM ubuntu:16.04
LABEL maintainer="James McClain <james.mcclain@gmail.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential git curl \
            python-dev python-numpy python-pip python-wheel python-setuptools python-mock python-enum34 \
            python3-dev python3-numpy python3-pip python3-wheel python3-setuptools python3-mock \
            openjdk-8-jdk && apt-get clean && \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get update && apt-get install bazel -y && apt-get clean

RUN mkdir -p /usr/local/src && cd /usr/local/src && \
    git clone 'https://github.com/tensorflow/tensorflow' && cd /usr/local/src/tensorflow && git checkout r1.8
COPY NOTES.txt /tmp/

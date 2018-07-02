FROM ubuntu:16.04
LABEL maintainer="James McClain <james.mcclain@gmail.com>"

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential git
RUN apt-get install -y --no-install-recommends python-dev python-numpy python-pip python-wheel python-setuptools python-mock python-enum34
RUN apt-get install -y --no-install-recommends openjdk-8-jdk curl
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN apt-get update && apt-get install bazel -y
# RUN pip install --upgrade enum34
# RUN pip install --upgrade mock

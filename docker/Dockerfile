FROM debian:stable
RUN apt-get update && apt-get install -y git zip nasm gcc make software-properties-common
RUN apt-add-repository contrib
RUN apt-add-repository non-free
RUN apt-get update && apt-get install -y nvidia-cuda-toolkit nvidia-cuda-dev pkg-config

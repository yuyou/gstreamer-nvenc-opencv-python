#FROM nvidia/cudagl:10.2-devel-ubuntu18.04
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update && \
  apt-get -y install --no-install-recommends \
  software-properties-common

# install FFMPEG
RUN add-apt-repository ppa:jonathonf/ffmpeg-4 \
  && apt -y install --no-install-recommends ffmpeg

# install deps (gstreamer)

RUN apt-get update && apt-get -y --no-install-recommends install \
    sudo \
    vim \
    wget \
    build-essential \
    autopoint \
    pkg-config \
    python3.6 \
    python3-pip \
    python3.6-dev \
    python3.6-venv \
    python-dev

RUN apt-get -y --no-install-recommends install \
    git \
    zip \
    unzip \
    autoconf \
    automake \
    libtool \
    gstreamer-1.0 \
    gstreamer1.0-dev \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-gl \
    python-gst-1.0 \
    libgirepository1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libcairo2-dev \
    gir1.2-gstreamer-1.0 \
    python3-gi \
    python-gi-dev \
    qt5-default glib-2.0 \
      libgraphene-1.0 \
      mesa-utils

RUN mkdir /home/gstreamer
COPY *.sh /home/gstreamer/

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

#download video codec sdk from Nvidia site

COPY Video_Codec_SDK_9.1.23.zip /home/gstreamer
RUN cd /home/gstreamer && bash ./install_video_codec_sdk.sh 
RUN cd /home/gstreamer && bash ./build_nvidia_gst_plugins.sh


# # build gst_python
RUN apt install -y --no-install-recommends \
    python3-gst-1.0 \
    python3-gi \
    python-gi-dev  \
    python3-gi-cairo  \
    libgirepository1.0-dev \
    gcc \
    libcairo2-dev \
    pkg-config \
    python3-dev \
    gir1.2-gtk-3.0 \
    libcairo2-dev \
    gir1.2-gstreamer-1.0

# RUN cd /home/gstreamer && \
#   git clone git://anongit.freedesktop.org/git/gstreamer/gst-python && \
#   cd gst-python && \
# git checkout $(gst-launch-1.0 --version | grep version | tr -s ' ' '\n' | tail -1) && \
# ./autogen.sh --disable-gtk-doc && \ 
# ./configure && \
# make -j && \
# make install && \
# cp -RT ./gi/overrides /usr/lib/python3/dist-packages/gi/overrides/ 

# # install OpenCV 4
RUN apt install -y --no-install-recommends \
    cmake python3-setuptools python3-wheel python3-pyqt5 python3-pyqt5.qtopengl && \
   apt remove -y python3-cairo && \
   pip3 install pycairo meson vispy watchdog  imutils dataclasses pygobject scikit-build
#   pip3 install opencv-python opencv-contrib-python


# # install https://github.com/jackersson/gstreamer-python

# RUN cd /home/gstreamer && \
#   git clone https://github.com/jackersson/gstreamer-python.git && \
#   cd gstreamer-python && \
#   python3 setup.py install

# OpenCV4

RUN pip3 install opencv-python opencv-contrib-python

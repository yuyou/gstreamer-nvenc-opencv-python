FROM yuyou/gstreamer-nvenc-opencv-python:1.16.2


COPY *.sh /home/gstreamer/

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

# build gst_python
RUN apt install -y \
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

RUN cd /home/gstreamer && bash ./build_gst_python.sh 

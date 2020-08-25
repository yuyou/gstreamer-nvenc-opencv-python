# gstreamer-nvenc-opencv-python

Docker image build script:
* Ubuntu 18.04
* OpenCV 4
* Python 3.6
* FFMPEG 4
* Gstreamer 1.16.2 with Nvidia NVidia Video SDK (10.0.26) for nvencoder/decoder (H.264/H.265)
* Python Gstreamer binding (https://github.com/jackersson/gstreamer-python)

## Prerequest

Download Nvidia Video SDK from https://developer.nvidia.com/nvidia-video-codec-sdk/download
and unpack it under the current project folder, using the name ~"Video_Codec_SDK"~

Note: The headerfile in SDK version 9 is under "./include" but SDK 10 is under "./Interface".

# Build the image

```
docker build -t yuyou/gstreamer-nvenc-opencv-python -f Dockerfile .
```

# Run the container


```
xhost local:root
docker run -it --gpus all -e NVIDIA_DRIVER_CAPABILITIES=all -e DISPLAY  -v /tmp/.X11-unix:/tmp/.X11-unix -e XAUTHORITY --rm -v $(pwd):/development yuyou/gstreamer-nvenc-opencv-python  bash

```
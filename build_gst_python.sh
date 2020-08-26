#!/bin/bash

git clone git://anongit.freedesktop.org/git/gstreamer/gst-python
cd gst-python
git checkout $(gst-launch-1.0 --version | grep version | tr -s ' ' '\n' | tail -1)
./autogen.sh --disable-gtk-doc 
# fix: PYTHON_LIBS='$PYTHON-config --embed --ldflags 2>/dev/null'
# add --embed
./configure
make -j
make install
# manual copy
cp -RT ./gi/overrides /usr/lib/python3/dist-packages/gi/overrides/
cd /



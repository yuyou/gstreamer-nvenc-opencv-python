git clone git://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad
cd gst-plugins-bad

git checkout $(gst-launch-1.0 --version | grep version | tr -s ' ' '\n' | tail -1)
./autogen.sh --disable-gtk-doc --noconfigure --libdir=/usr/lib/x86_64-linux-gnu
NVENCODE_CFLAGS="-I/usr/local/cuda/include" ./configure --with-cuda-prefix="/usr/local/cuda" --libdir=/usr/lib/x86_64-linux-gnu

cd sys/nvenc
make
make install

cd ../..

cd sys/nvdec
make
make install

cd /
rm -rf /home/gstreamer/gst-plugins-bad/

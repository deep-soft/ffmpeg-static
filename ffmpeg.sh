#!/usr/bin/env bash

set -ex

cd ffmpeg
./configure \
	--prefix=dist \
	--disable-debug \
	--enable-static \
	--disable-shared \
	--enable-pic \
	--enable-stripping \
	--disable-programs \
	--enable-gpl \
	--enable-libx264 \
	--disable-bzlib \
	--disable-alsa \
	--disable-appkit \
	--disable-avfoundation \
	--disable-coreimage \
	--disable-iconv \
	--disable-libxcb \
	--disable-libxcb-shm \
	--disable-libxcb-xfixes \
	--disable-libxcb-shape \
	--disable-lzma \
	--disable-schannel \
	--disable-sdl2 \
	--disable-securetransport \
	--disable-xlib \
	--disable-zlib \
	--disable-amf \
	--disable-audiotoolbox \
	--disable-cuda-llvm \
	--disable-cuvid \
	--disable-d3d11va \
	--disable-dxva2 \
	--disable-ffnvcodec \
	--disable-nvdec \
	--disable-nvenc \
	--disable-vaapi \
	--disable-vdpau \
	--disable-videotoolbox \
	--extra-cflags=-I../x264/dist/include \
	--extra-ldflags=-L../x264/dist/lib

make -j$(nproc) V=1
make install

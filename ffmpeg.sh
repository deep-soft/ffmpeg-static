#!/usr/bin/env bash

set -ex

cd ffmpeg
PKG_CONFIG_PATH="../dist/lib/pkgconfig" ./configure \
	--prefix=../dist \
	--disable-debug \
	--enable-static \
	--disable-shared \
	--enable-pic \
	--enable-stripping \
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
	--disable-nvdec \
	--disable-vaapi \
	--disable-vdpau \
	--disable-videotoolbox \
	--extra-cflags="$FFMPEG_CFLAGS" \
	--extra-ldflags="$FFMPEG_LIBRARY_PATH" \
	$FFMPEG_EXTRA_ARGS

make -j$(nproc)
make install

#!/usr/bin/env bash

set -ex

if [ "$OSTYPE" == "linux-gnu" ]; then
    export RUNNER_OS="Linux"
fi

export FFMPEG_EXTRA_ARGS="--disable-nvenc --disable-ffnvcodec"

if [ "$RUNNER_OS" == "Windows" ]; then
    export CC=cl
    export FFMPEG_EXTRA_ARGS="$FFMPEG_EXTRA_ARGS --toolchain=msvc"
    export FFMPEG_CFLAGS="-I../dist/include"
    export FFMPEG_LIBRARY_PATH="-LIBPATH:../dist/lib"
else
    export FFMPEG_CFLAGS="-I../dist/include"
    export FFMPEG_LIBRARY_PATH="-L../dist/lib"
    if [ "$RUNNER_OS" == "Linux" ]; then
        export FFMPEG_EXTRA_ARGS="--enable-nvenc --enable-ffnvcodec"
    fi
fi

./x264.sh
if [ "$RUNNER_OS" == "Linux" ]; then
    ./nv-codec-headers.sh
fi
./ffmpeg.sh

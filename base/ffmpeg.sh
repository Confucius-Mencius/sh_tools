#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

FFMPEG_BIN_DIR=/opt/third_party/release/ffmpeg/bin
export LD_LIBRARY_PATH=${FFMPEG_BIN_DIR}/../lib:${FFMPEG_BIN_DIR}/../../fdk_aac/lib:${FFMPEG_BIN_DIR}/../../x264/lib
${FFMPEG_BIN_DIR}/ffmpeg -i ~/Downloads/VIDEO0018.mp4 -f s16le ~/Downloads/out.pcm

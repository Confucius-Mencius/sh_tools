#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

FFMPEG_BIN_DIR=/opt/third_party/release/ffmpeg/bin
export LD_LIBRARY_PATH=${FFMPEG_BIN_DIR}/../lib:${FFMPEG_BIN_DIR}/../../fdk_aac/lib:${FFMPEG_BIN_DIR}/../../x264/lib

${FFMPEG_BIN_DIR}/ffprobe ~/Desktop/fcz2.flv

# 抽取mp4中的原始音频数据
${FFMPEG_BIN_DIR}/ffmpeg -i ~/Desktop/hgc-2018-Q3.mp4 -sample_rate 44100 -channels 2 -f s16le ~/Downloads/out.pcm

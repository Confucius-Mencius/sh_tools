#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

FFMPEG_BIN_DIR=/opt/third_party/release/ffmpeg/bin
export LD_LIBRARY_PATH=${FFMPEG_BIN_DIR}/../lib:${FFMPEG_BIN_DIR}/../../fdk_aac/lib:${FFMPEG_BIN_DIR}/../../x264/lib

#${FFMPEG_BIN_DIR}/ffprobe ~/Desktop/fcz2.flv

# 抽取mp4中的原始音频数据
#${FFMPEG_BIN_DIR}/ffmpeg -i ~/Desktop/hgc-2018-Q3.mp4 -sample_rate 44100 -channels 2 -f s16le ~/Downloads/out.pcm

${FFMPEG_BIN_DIR}/ffmpeg -devices

# linux下查看视频设备：
v4l2-ctl --list-devices
${FFMPEG_BIN_DIR}/ffmpeg -f v4l2 -list_formats all -i /dev/video0

# linux下查看音频设备：
# 如果你的系统有 /proc/asound/cards 路径,说明 ALSA 驱动已经使用上,可查看 sound devices。
# 执行以下命令可看到当前的音频设备。
cat /proc/asound/cards

# 查看音频输入设备（microphone 、麦克风、音频采集卡等）
# 执行以下命令可看到当前的音频输入设备。
arecord -l

# 查看音频输出设备（扬声器，speaker）
aplay -l

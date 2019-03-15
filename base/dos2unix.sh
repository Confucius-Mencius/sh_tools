#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

# 遍历指定目录及其中的子目录，对所有文件执行dos2unix。排除.git目录
# 注意dos2unix会去掉utf8的bom，可以加选项--add-bom

function Usage()
{
    echo "Usage: $1 <dir>"
    exit 0
}

if [ $# -lt 1 ]; then
    Usage $0
fi

DIR=$1

for i in `find $DIR`; do
    if [ ! -d $i ]; then
        ls $i | grep -v ".git" | xargs dos2unix
    fi
done

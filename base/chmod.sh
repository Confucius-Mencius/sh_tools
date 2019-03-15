#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

function Usage()
{
    echo "Usage: $1 <dir>"
    exit 0
}

if [ $# -lt 1 ]; then
    Usage $0
fi

DIR=$1

for i in `find $DIR -name "*.h" -o -name "*.cpp" -o -name "*.pro" -o -name "*.ui" -o -name "*.qrc" -o -name "*.vert" -o -name "*.frag" -o -name "*.md"`; do
    if [ ! -d $i ]; then
        chmod -x $i
    fi
done

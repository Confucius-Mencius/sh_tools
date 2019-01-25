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

for i in `find $DIR`; do
    if [ ! -d $i ]; then
        dos2unix $i
    fi
done

#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

function Usage
{
    echo "Usage: $1 <dir>"
    exit -1
}

if [ $# -lt 1 ]; then
    Usage $0
fi

DIR=$1

for i in `find $DIR -name "*.h" -o -name "*.cpp"`
do
    if [ ! -d $i ]; then
        astyle --style=allman -p --pad-header --align-pointer=type --convert-tabs --indent-preproc-define --indent-switches --add-braces --attach-closing-while $i
    fi
done

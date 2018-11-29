#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

SCRIPT_PATH=$(cd `dirname $0`; pwd)
 
function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
function version_le() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

# if [ $# != 2 ]; then
#     echo "usage: ${SCRIPT_PATH}/version_compare.sh <v1> <v2>"
#     exit 1
# fi

# VERSION1=$1
# VERSION2=$2

# if version_gt ${VERSION1} ${VERSION2}; then
#    echo "${VERSION1} is greater than ${VERSION2}"
# fi
 
# if version_le ${VERSION1} ${VERSION2}; then
#    echo "${VERSION1} is less than or equal to ${VERSION2}"
# fi
 
# if version_lt ${VERSION1} ${VERSION2}; then
#    echo "${VERSION1} is less than ${VERSION2}"
# fi
 
# if version_ge ${VERSION1} ${VERSION2}; then
#    echo "${VERSION1} is greater than or equal to ${VERSION2}"
# fi

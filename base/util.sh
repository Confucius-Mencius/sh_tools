#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

function MakeDir()
{
    DIR=$1

    if [ ! -d ${DIR} ]; then
        mkdir -p ${DIR}
    fi
}

function Processbar()
{  
  local current=$1; local total=$2;  
  local maxlen=80; local barlen=66; local perclen=14;  
  local format="%-${barlen}s%$((maxlen-barlen))s"  
  local perc="[$current/$total]"  
  local progress=$((current*barlen/total))  
  local prog=$(for i in `seq 0 $progress`; do printf '#'; done)  
  printf "\r$format" $prog $perc  
}  

function SwapFileContent()
{
    TMP_FILE=/tmp/`date +%s`.tmp
    mv $1 ${TMP_FILE}
    mv $2 $1
    mv ${TMP_FILE} $2
    rm -rf ${TMP_FILE}
}

#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

function PackThirdParties
{
    # echo "pack third party libs"

    FROM_DIR=$1
    TO_DIR=$2
    LIB_LIST=$3

    MakeDir ${TO_DIR}/third_party

    for i in ${LIB_LIST[@]}; do
        # echo "pack "$i

        SRC_LIB_DIR=${FROM_DIR}/$i/lib
        SRC_LIB64_DIR=${FROM_DIR}/$i/lib64

        if [ -d ${SRC_LIB_DIR} ]; then
            cp -d -f ${SRC_LIB_DIR}/lib*.so* ${TO_DIR}/third_party/
        elif [ -d ${SRC_LIB64_DIR} ]; then
            cp -d -f ${SRC_LIB64_DIR}/lib*.so* ${TO_DIR}/third_party/
        fi
    done
}

function PackCommonComponents
{
    # echo "pack common components"

    FROM_DIR=$1
    TO_DIR=$2

    MakeDir ${TO_DIR}/common_component

    cp -d -rf ${FROM_DIR}/lib*.so* ${TO_DIR}/common_component/
    cp -f ${FROM_DIR}/app_launcher ${TO_DIR}/common_component/
}

# 通用的pack动态库
function PackLib
{
    FROM_DIR=$1
    TO_DIR=$2
    LIB_NAME=$3
    
    # echo "pack "${LIB_NAME}
    cp -d -rf ${FROM_DIR}/${LIB_NAME} ${TO_DIR}/
}

function PackServer
{
    FROM_DIR=$1
    TO_DIR=$2
    SERVER_NAME=$3

    # echo "pack "${SERVER_NAME}
    cp -d -rf ${FROM_DIR}/${SERVER_NAME} ${TO_DIR}/
}

function PackScripts
{
    # echo "pack scripts"

    FROM_DIR=$1
    TO_DIR=$2

    cp -rf ${FROM_DIR}/scripts ${TO_DIR}/
}

function PackConf
{
    # echo "pack conf"

    FROM_DIR=$1
    TO_DIR=$2

    cp -rf ${FROM_DIR}/conf ${TO_DIR}/
}

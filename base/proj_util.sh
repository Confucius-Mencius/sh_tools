#!/bin/bash

###############################################################################
# author: BrentHuang (guang11cheng@qq.com)
###############################################################################

LOGIC_CPU_COUNT=`cat /proc/cpuinfo | grep "processor" | wc -l`

if [ -f /usr/bin/ninja ]; then
    CMAKE_GENERATOR="Ninja"
    RUN_MAKE_CMD="/usr/bin/ninja -v -j ${LOGIC_CPU_COUNT}"
    RUN_TEST_CMD="/usr/bin/ninja test"
    RUN_INSTALL_CMD="/usr/bin/ninja -v install"
else
    CMAKE_GENERATOR="Unix Makefiles"
    RUN_MAKE_CMD="make -j ${LOGIC_CPU_COUNT}"
    RUN_TEST_CMD="make test"
    RUN_INSTALL_CMD="make install"
fi

function BuildProj()
{
    PROJ=$1
    PROJ_DIR=$2
    BUILD_DIR=$3
    BUILD_TYPE=$4
    INSTALL_PREFIX=$5
    RUN_TEST=$6

    MakeDir ${BUILD_DIR}
    cd ${BUILD_DIR}
    
    /usr/bin/cmake ${PROJ_DIR} -G "${CMAKE_GENERATOR}" -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
    if [ $? -ne 0 ]; then
        echo "failed to execute cmake in proj ["${PROJ}"]"
        cd ..
        exit 1
    fi

    ${RUN_MAKE_CMD}
    if [ $? -ne 0 ]; then
        echo "failed to execute make in proj ["${PROJ}"]"
        cd ..
        exit 1
    fi

    if [ ${RUN_TEST} == 1 ]; then
        ${RUN_TEST_CMD}
        if [ $? -ne 0 ]; then
            echo "failed to execute unit test in proj ["${PROJ}"]"
            cd ..
            exit 1
        fi
    fi
}

function RebuildProj()
{
    BUILD_DIR=$3
    rm -rf ${BUILD_DIR}

    BuildProj $1 $2 $3 $4 $5 $6
}

function InstallProj()
{
    PROJ=$1
    BUILD_DIR=$2

    cd ${BUILD_DIR}
    sudo ${RUN_INSTALL_CMD}

    if [ $? -ne 0 ]; then
        echo "failed to execute install in proj ["${PROJ}"]"
    fi
}

function ClearProj()
{
    PROJ=$1
    BUILD_DIR=$2
    rm -rf ${BUILD_DIR}
}

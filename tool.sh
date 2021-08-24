#!/bin/bash

_CMD="NONE"
_TARGET="NONE"
_PATH="NONE"

if [ -z "$1" ]; then
    echo "$0 CMD!='Empty' [CONF|FOLDER]"
    echo "how to use :"
    echo "Easy way to start/stop docker-compose projects ..."
    echo "    -s, --start     start the project by configuration"
    echo "    -S, --stop      stop working project"
    echo "    -l, --list      list status with configuration"
    #echo "    -a, --status-all list all working project status form FOLDER"
    echo "    -d, --logs      display/log with configuration"
    
    echo "eg. :"
    echo "$0 -s ./docker-compose.yml"
    echo "$0 -S /home/mr.ok/docker-compose-sorry.yml"
    echo "$0 -d "
    echo "    (default use ./docker-compose.yml)"
    echo ""
    echo "---- docker-compose version -----"
    docker-compose --version
    whereis docker-compose
    echo ""
else
    _CMD="$1"
    _TARGET="$2"
    if [ -d "$_TARGET" ]; then
        _PATH="$_TARGET"
        _TARGET="DEFAULT"
    else
        _PATH=`readlink -f "$_TARGET" | xargs dirname`
    fi
    
    echo "we get: $0 $_CMD $_PATH$_TARGET"
    sleep 2
fi

if [ "-s" == "$_CMD" ] || [ "--start" == "$_CMD" ]; then
    if [ "DEFAULT" == "$_TARGET" ]; then
        sudo docker-compose -f docker-compose.yml up -d
    else
        sudo docker-compose -f "$_PATH$_TARGET" up -d
    fi
else
    echo "you command has error or not support yet."
fi

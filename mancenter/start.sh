#!/bin/sh

if [ "$1" = "--help" ] || [ $# -eq 1 ] || [ $# -gt 4 ] ; then
    echo "usage: start.sh"
    echo "usage: start.sh [port] [path]"
    echo "usage: start.sh [port] [path] [classpath]"
    exit;
fi

if [ $# -eq 4 ] ; then
    echo "Starting with version 3.11, WAR file is not expanded anymore. No need to pass expandWarPath parameter."
    java -cp "hazelcast-mancenter-3.11.3.war:$3" Launcher "$1" "$2"
elif [ $# -eq 3 ] ; then
    java -cp "hazelcast-mancenter-3.11.3.war:$3" Launcher "$1" "$2"
elif [ $# -eq 2 ] ; then
    java -cp hazelcast-mancenter-3.11.3.war Launcher "$1" "$2"
else
    java -cp hazelcast-mancenter-3.11.3.war Launcher
fi
#!/bin/sh

BUILD=".public/"

case "$1" in
    "clean" | "c")
        rm -r $BUILD
        ;;
    "build" | "b")
        ([ "$2" = "watch" ] || [ "$2" = "w" ]) && args="--watch" 
        zig build -p $BUILD $args
        ;;
    "serve" | "s")
        cd $BUILD && python3 -m http.server
        ;;
    "deploy" | "d")
        rsync -rv $BUILD focus@104.207.148.71:/var/www/scurvyless --delete
        ;;
    "" | *)
        echo "usage: $0 build|clean|deploy|serve"
        exit 1
        ;;
esac


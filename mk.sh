#!/bin/sh

case "$1" in
    "clean" | "c")
        rm -r public
        ;;
    "build" | "b")
        echo "Building scurvyless..."
        ([ "$2" = "watch" ] || [ "$2" = "w" ]) && args="--watch" 
        zig build -p public $args
        ;;
    "serve" | "s")
        # cd public && python3 -m http.server -d public/
        # bun x browser-sync start --server "public/" --files "**/*.html, **/*.css, **/*.js"
        # go run cmd/main.go
        air
        ;;
    "deploy" | "D")
        rsync -r public/ root@gingerfocus.dev:/var/www/scurvyless
        ;;
    "develop" | "dev" | "d")
        [ -n "$TMUX" ] || (echo "Must be run in tmux" && exit 1)

        tmux splitw -d -h -p 30 -c "$HOME/dev/scurvyless" './mk.sh build watch'
        tmux splitw -d -t 1 './mk.sh serve'
        ;;
    "" | *)
        echo "usage: $0 build|clean|deploy|serve"
        exit 1
        ;;
esac


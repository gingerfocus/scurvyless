#!/bin/sh

case "$1" in
    "clean" | "c")
        rm -r public
        ;;
    "build" | "b")
        ([ "$2" = "watch" ] || [ "$2" = "w" ]) && args="--watch"
        ../zig/build/stage3/bin/zig build -p public $args
        # zig build -p public $args
        ;;
    "serve" | "s")
        python3 -m http.server -d public/
        ;;
    "deploy" | "D")
        rsync -r public/ root@gingerfocus.dev:/var/www/scurvyless
        ;;
    "develop" | "dev" | "d")
        [ -n "$TMUX" ] || (echo "Must be run in tmux" && exit 1)

        tmux splitw -d -h -p 30 -c "$HOME/dev/scurvyless" 'nix run .#watch'
        tmux splitw -d -t 1 'nix run .#serve'
        ;;
    *)
        echo "usage: $0 build|clean|deploy|serve"
        exit 1
        ;;
esac


#!/bin/bash

img="$1"

# Skip if no files match the pattern
[ -e "$img" ] || exit 1

# Get the filename without the extension
filename="${img%.*}"

echo "Processing $img... to $filename.webp"

# Convert, Resize (only if larger than 1024px), and Compress
# -resize 1024x\> ensures it only shrinks, never stretches
# -quality 75 is the sweet spot for WebP academic figures
magick "$img" -resize "1024x>" -quality 75 "${filename}.webp"

#!/usr/bin/bash

W=150
H=150

# Keep only 1000 images of each class
rm cat.{1000:12500}.jpg
rm dog.{1000:12500}.jpg

echo "Done removing images"

# Resize
for f in *.jpg; do
    convert -resize ${H}x${W} $f $f
done

echo "Done resizing"

# Add padding to all images
for f in *.jpg; do
    ./aspect ${W}x${H} -m pad $f $f
done

echo "Done padding"


#!/bin/bash

DEST=/Users/mkthompson/home_dev/montessori_albums/static/img/culture/geo
WORKING_DIR=/Volumes/RAMDisk/img/

cd $WORKING_DIR

if [ -z "$2" ]; then

  convert $1  -strip $DEST/"${1%%.*}.webp"

else

  convert $1 -resize "$2"% -quality 82 -strip $DEST/"${1%%.*}.webp"

fi

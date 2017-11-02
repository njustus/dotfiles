#!/bin/bash

FILE=$1

scanimage --format=tiff \
          -x 215 -y 297 \
          --resolution 300 > $FILE.tiff
          #--mode Gray \

convert $FILE.tiff -compress jpeg -quality 40 $FILE.pdf

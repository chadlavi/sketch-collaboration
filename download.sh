#!/bin/sh
# forked from https://github.com/blended/sketch-collaboration

if [ -z "$1" ]; then
	echo "syntax: download.sh [directory]"
	exit 1
fi

# Pull the latest changes from the repo
git pull

# Zip core Sketch data
cd $1/ && zip $1.zip -r .

# Copy .zip to .sketch
cp $1.zip ../$1.sketch

# Remove zip
rm -Rf $1.zip && cd ..

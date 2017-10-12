#!/bin/sh
# forked from https://github.com/blended/sketch-collaboration

if [ -z "$1" ]; then
	echo "syntax: upload.sh [commit message]"
	exit 1
fi

# Pull the latest changes from the repo
git pull

for f in *.sketch
do
  # Copy .sketch to .zip
  cp $f.sketch $f.zip

  # Unzip the file and delete
  unzip -o $f.zip -d $f/
  rm -Rf $f.zip

  # Remove the preview file
  rm -Rf $f/previews/

  git add $f/
done

git add .

# commit and push with a variable
git commit -m "$1" && git push

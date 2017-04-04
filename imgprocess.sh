#!/bin/bash

# Script to convert all image jpeg files from a directory (argument) into png format file
# and it also reduces size of images

# Sanity checks ?
# ...

# Main code

ls -1 $1*.jpg > .imagefiles.tmp

while read imgfile
do
	lengthname=${#imgfile}
	namefile=${imgfile:0:($lengthname-4)}
	convert $imgfile -resize 200x200 $namefile.png

done < .imagefiles.tmp
rm .imagefiles.tmp
exit 0

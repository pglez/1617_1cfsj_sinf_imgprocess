#!/bin/bash

# Script to convert all image jpeg files from a directory (argument) into png format file
# and it also reduces size of images

# Sanity checks ?
# ...

# Main code


ls -1 $1* > .imagefiles.tmp

option=2
force=0
input=500x500
num=1

lengthname=${#imgfile}
namefile=${imgfile:0:($lengthname-4)}
namefile+="$num"

while read imgfile
do
	case $option in
		1)
		convert $imgfile -resize $input $namefile.png
		;;
		2)
		if [$force=0]; then
			input+="!"
			convert $imgfile -resize $input $namefile.png
		else
			convert $imgfile -resize $input $namefile.png
		fi
	esac
done < .imagefiles.tmp
rm .imagefiles.tmp
exit 0

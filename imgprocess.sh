#!/bin/bash

function extract_name () {
	filename=$(basename "$imgfile")
	path=$(dirname "$imgfile")
	namefile="${filename%.*}"
	pathfile="$path/$namefile"
}

load="/home/adrian/Atom/Prueba"
ls -1 $load*.* > .imagefiles.tmp

format="png"

echo "Comment:"
read comment

while read imgfile
do
	extract_name
	convert -comment "$comment" $imgfile.$format

done < .imagefiles.tmp
rm .imagefiles.tmp
exit 0

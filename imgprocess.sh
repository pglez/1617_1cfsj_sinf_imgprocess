#!/bin/bash
function resize-format () {
  #option=2
  #read -p "Force or not(0-1): " force
  #read -p "Input the size: " input
  #read -p "Input the format: " format
  ls -1 $load*.* > .imagefiles.tmp
  while read imgfile
  do
  	extract_name
  	case $option in
  		1)
  		convert $imgfile -resize $input $pathfile.$format
  		;;
  		2)
  		if [ $force = 0 ]; then
  			input+="!"
  			convert $imgfile -resize $input $pathfile.$format
  		else
  			convert $imgfile -resize $input $pathfile.$format
  		fi
  		;;
  	esac
  done < .imagefiles.tmp
  rm .imagefiles.tmp
}

function watermark () {
  ls -1 $load*.* > .imagefiles.tmp
  format="png"
  read -p "Introduce the watermark text: " watermark
  while read imgfile
  do
    extract_name

    convert -size 140x80 xc:none -fill grey \
            -gravity NorthWest -pointsize 15 -draw "text 10,10 '$watermark'" \
            -gravity SouthEast -pointsize 15 -draw "text 5,15 '$watermark'" \
            miff:- |\
      composite -tile - $imgfile  $pathfile.$format
  done < .imagefiles.tmp
  rm .imagefiles.tmp
}

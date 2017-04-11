#!/bin/bash

#Add code to save in new folder
function define_path () {
  if [[ ! $path = "" ]]
  then
    path=$load
  fi
}
#function to change load if there are more than one processing option.
#Use function overwrite_load in all options
function overwrite_load () {
  if [[ counter = 1 ]]
  then
    load=$path
  fi
}
#function to define final_file (path)
function extract_name () {
  filename=$(basename "$imgfile") #Extract the name file ex: file.jpg
  namefile="${filename%.*}" #Extract name of a file without extension
  pathfile="$path/$namefile" #Put together path and name file, then we choose the extension to convert
}

counter=0

define_path #function

echo "Format:"
read format

ls -1 $load*.* > .imagefiles.tmp
while read imgfile
do
	extract_name
	convert $imgfile -resize 200x200 $pathfile.$format

done < .imagefiles.tmp
rm .imagefiles.tmp

exit 0

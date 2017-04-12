#!/bin/bash
#check if directory exist
  function imagecheck {
    if [ ! -d $1 ]
  then
    echo "Directory doesn't exist"
    exit 1
  else
  #check if directoy is empty
  if ! find "$1" -mindepth 1 -print -quit | grep -q .
    then
      echo "Directory is empty"
      exit 1
    else
  #Loop to check if files are images through file mime-type
  for Item in $(ls $1)
    do
      filemime="$(file --mime-type -b $1/$Item)"
      case $filemime in
        image/*) echo $Item >> $1/imgfiles.txt;;
        *) ;;
      esac
    done
    echo "Done, image filenames written in imgfiles.txt"
  fi
fi
exit 0
}
#feed the path of directory variable as an argument to the function"
# like this:  imagecheck $load

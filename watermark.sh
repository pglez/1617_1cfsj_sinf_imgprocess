function extract_name () {
  filename=$(basename "$imgfile") #Extract the name file ex: file.jpg
  path=$(dirname "$imgfile") #Extract the path of a file ex: home/folder
  namefile="${filename%.*}" #Extract name of a file without extension
  pathfile="$path/$namefile" #Put together path and name file, then we choose the extension to convert
}

load="/home/INFORMATICA/alu53785874y/1617_1cfsj_sinf_imgprocess/images/"
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
exit 0

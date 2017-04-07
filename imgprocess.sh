function extract_name () {
  filename=$(basename "$imgfile") #Extract the name file ex: file.jpg
  path=$(dirname "$imgfile") #Extract the path of a file ex: home/folder
  namefile="${filename%.*}" #Extract name of a file without extension
  pathfile="$path/$namefile" #Put together path and name file, then we choose the extension to convert
}
load="/home/INFORMATICA/alu53785874y/1617_1cfsj_sinf_imgprocess/images/"
ls -1 $load*.* > .imagefiles.tmp

option=2
read -p "Force or not(0-1): " force
read -p "Input the size: " input
read -p "Input the format: " format

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
exit 0

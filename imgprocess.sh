function extract_name () {
	filename=$(basename "$imgfile")
	path=$(dirname "$imgfile")
	namefile="${filename%.*}"
	pathfile="$path/$namefile"
}

load="/home/INFORMATICA/alu20490173w/1617_1cfsj_sinf_imgprocess-master/images/"
ls -1 $load*.* > .imagefiles.tmp

format="png"

while read imgfile
do
	extract_name

	convert $imgfile -auto-level $pathfile.$format


done < .imagefiles.tmp
rm .imagefiles.tmp
exit 0

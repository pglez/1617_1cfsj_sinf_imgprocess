ls -1 $1*.jpg > .imagefiles.tmp

while read imgfile
do
	lengthname=${#imgfile}
	namefile=${imgfile;0;($lengthname-4)}
	convert -rotate $1 $imgfile $imgfile

done < .imagefiles.tmp
rm imagefiles.tmp
exit 0

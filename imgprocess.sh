function rotate () {
	ls -1 $load*.* > .imagefiles.tmp

	while read imgfile
	do

		convert -rotate $valuerotate $imgfile $imgfile

	done < .imagefiles.tmp
	rm imagefiles.tmp
}

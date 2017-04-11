
function image-edit () {
	ls -1 $load*.* > .imagefiles.tmp
	format="png"

	while read imgfile
	do
		extract_name

		convert $imgfile -auto-level $pathfile.$format


	done < .imagefiles.tmp
	rm .imagefiles.tmp
}


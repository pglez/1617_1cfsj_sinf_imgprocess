function () {
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

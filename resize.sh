#!/bin/bash
# returns 0 if pixels, returns 1 if percent
function resizecheck{
if  [[ ! $1 =~ ([0-9]+[xX][0-9]+|[0-9]+%) ]]
  then
    echo "Syntax ERROR"
    exit 1
  else
  declare -i sizeformat
if [[  $1 =~ [0-9]+[xX][0-9]+ ]]
  then
    sizeformat=0
  else
  sizeformat=1
fi
fi
exit $sizeformat
}

# resizecheck $(name of the variable containing the input of the resize box)

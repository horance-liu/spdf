#!/bin/bash

rm -rf output && mkdir output

pages=""
for i in `seq 1 $2`; do  
  pages="$pages $i"
done

python split.py $1 $pages

for file in *.pdf; do
  sips -s format jpeg $file --out "output/${file}.jpg"
  rm -rf $file
done

sips -z 336 448 output/*.jpg
#sips -z 319.2 425.6 output/*.jpg


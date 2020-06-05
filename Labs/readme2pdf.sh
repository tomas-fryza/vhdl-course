#!/bin/bash
# Convert README files to PDF

pandocparams="-V colorlinks -V urlcolor=Magenta \
    --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" \
    --highlight-style=tango"

cd ..
filename="labs"
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H Labs/head.tex README.md -o ${filename}.pdf ${pandocparams}
echo "done."

filename="01-gates"
cd Labs/${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf ${pandocparams}
echo "done."

filename="02-ise"
cd ../${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf ${pandocparams}
echo "done."

filename="03-segment"
cd ../${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf ${pandocparams}
echo "done."

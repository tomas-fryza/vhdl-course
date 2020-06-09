#!/bin/bash
# Convert README files to PDF

#pandocparams="--variable=geometry:`margin=2.25cm, paperheight=842pt, paperwidth=595pt` \
#    --highlight-style tango"
#    --highlight-style zenburn"
#    --highlight-style kate"
#    --highlight-style haddock
#    --highlight-style espresso
#    --highlight-style pygments"

pandocstyle="--highlight-style=zenburn"

cd ..
filename="labs"
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H Labs/head.tex README.md -o ../${filename}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
echo "done."

filename="01-gates"
cd Labs/${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
echo "done."

filename="02-ise"
cd ../${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
echo "done."

filename="03-segment"
cd ../${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
echo "done."

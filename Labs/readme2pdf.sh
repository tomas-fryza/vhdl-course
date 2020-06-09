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
pandoc -H Labs/head.tex README.md -o Labs/${filename}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
echo "done."

filename="01-gates"
cd Labs/${filename}
echo -n "Converting `pwd`/README.md -> ${filename}.pdf... "
pandoc -H ../head.tex README.md -o ../${filename}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
echo "done."

#for ii in 02-ise 03-segment 04-adder 05-counter_binary 06-display_driver 07-stopwatch
for ii in 08-traffic_lights
do
    cd ../${ii}
    echo -n "Converting `pwd`/README.md -> ${ii}.pdf... "
    pandoc -H ../head.tex README.md -o ../${ii}.pdf --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" ${pandocstyle}
    echo "done."
done

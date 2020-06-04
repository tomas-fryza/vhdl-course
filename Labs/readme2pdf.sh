#!/bin/bash
# Convert README files to PDF

filename="README"
pandocparams="-V colorlinks -V urlcolor=Magenta \
    ${filename}.md -o ${filename}.pdf \
    --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" \
    --highlight-style=tango"

cd ..
echo -n "Converting `pwd`/${filename}.md ..."
pandoc -H Labs/head.tex ${pandocparams}
echo "done"

cd Labs/01-gates
echo -n "Converting `pwd`/${filename}.md ..."
pandoc -H ../head.tex ${pandocparams}
echo "done"

cd ../02-ise
echo -n "Converting `pwd`/${filename}.md ..."
pandoc -H ../head.tex \
    -V colorlinks -V urlcolor=Magenta \
    ${filename}.md -o ${filename}.pdf \
    --variable=geometry:"margin=2.25cm, paperheight=842pt, paperwidth=595pt" \
    --highlight-style=tango
echo "done"

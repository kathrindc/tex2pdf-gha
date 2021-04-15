#!/bin/sh -l

base="$(basename $1 .tex)"

echo "ACTION >>> Compiling first pass (likely to produce errors)"

pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $1

echo "ACTION >>> Running bibtex"

bibtex $base.aux

if [ "$?" != "0" ]; then
    echo "ACTION >>> Error while building bibliography, aborting."
    exit 1
fi

echo "ACTION >>> Running makeglossaries"

makeglossaries $base

if [ "$?" != "0" ]; then
    echo "ACTION >>> Error while making glossaries, aborting."
    exit 1
fi

echo "ACTION >>> Compiling second pass"

pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $1

if [ "$?" != "0" ]; then
    echo "ACTION >>> Error while running second pass, aborting."
    exit 1
fi

echo "ACTION >>> Compiling third pass"

pdflatex -synctex=1 -interaction=nonstopmode -shell-escape $1

if [ "$?" != "0" ]; then
    echo "ACTION >>> Error while running third pass, aborting."
    exit 1
fi

echo "ACTION >>> Done."

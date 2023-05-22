#!/bin/bash

# script to automatically convert documents (docx) 
# to github flavoured markdown and PDF
# packages: libreoffice libreoffice-java-common default-jre pandoc

# Remove any previous assets
rm -rf *.markdown
rm -rf other_formats/pdfs/*.pdf
rm -rf media_assets

cd other_formats/docx/

# Markdown
for f in *.docx; do
    pandoc --extract-media media_assets/$f -f docx -t gfm $f -o $f".markdown"
done

mv *.markdown ../../
mv media_assets ../../

# PDFs
for f in *.docx; do
    libreoffice --headless --convert-to pdf $f --outdir ../pdfs/
done
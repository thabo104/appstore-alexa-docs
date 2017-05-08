echo "Building the PDF ...";
prince --javascript --input-list=_site/prince-list.txt -o pdf/firetv-cont-watch-recs.pdf;
echo "Done. Look in the /pdf folder in your project directory.";

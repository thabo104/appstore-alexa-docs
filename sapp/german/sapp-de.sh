# first build your output
echo "Remove the existing webapp folder ..."
rm -r webapp;
echo "Create new webapp folder ..."
mkdir webapp;
echo "Copy contents from _output_de into webapp folder ..."
cp -r ../../_output_de/* webapp;
echo "Push to local webapp folder to webapp on sapp.amazon.com ..."
sapp deploy
echo "Done. After a few minutes, view your site at https://sapp.amazon.com/devcomm-appstore-de"

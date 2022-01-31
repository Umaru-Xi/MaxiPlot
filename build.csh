 #! /bin/csh
 
mkdir origin
mkdir tmp
cp ./* ./origin/
make SOURCE=$1
make SOURCE=$1
mv ./* ./tmp/
mkdir build
mv ./tmp/origin/* ./
mv ./tmp/*.pdf ./build/
rm -r ./tmp
exit 0

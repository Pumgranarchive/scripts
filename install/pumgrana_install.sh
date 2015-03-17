#!/bin/sh

echo "Pumgrana - instalation..."

sudo apt-get install curl

cd /tmp
git clone https://github.com/Pumgrana/libraries.git
cd libraries
make reinstall

cd
git clone https://github.com/Pumgrana/Api.git
cd Api
make

echo "63346996ced856bcd13d15996d7cdbe531c5472" > prototype/token

# (cd prototype ; sudo ../../mongo/import.sh ; sudo ../../4store/run.sh;sudo ../../4store/import_db.sh)

printf "Done\n\n"

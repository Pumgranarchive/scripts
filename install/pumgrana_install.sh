#!/bin/sh

echo "Pumgrana - instalation..."

(cd /tmp && git clone https://github.com/Pumgrana/libraries.git && cd libraries && make reinstall)

sudo apt-get install curl


git clone https://github.com/Pumgrana/prototype.git && cd prototype && make && cd ..

(cd prototype ; sudo ../../mongo/import.sh ; sudo ../../4store/run.sh;sudo ../../4store/import_db.sh)


printf "Done\n\n"

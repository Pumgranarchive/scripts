#!/bin/sh

echo "Pumgrana - instalation..."

(cd /tmp && git clone https://github.com/Pumgrana/libraries.git && cd libraries && make reinstall)

git clone https://github.com/Pumgrana/prototype.git && cd prototype && ./export_db/import.sh && make && cd ..

printf "Done\n\n"

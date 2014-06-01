#!/bin/sh

echo "Pumgrana - instalation..."

git clone https://github.com/Pumgrana/prototype.git && cd prototype && ./export_db/import.sh && make && cd ..

printf "Done\n\n"

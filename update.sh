#!/bin/sh

tar -xvf ocaml-data-notation.tar.gz
cd ocaml-data-notation && ./configure && make && sudo make install && cd ..

tar -xvf oasis.tar.gz
cd oasis && ./configure && make && sudo make install && cd ..

echo "Y\n" | opam reinstall eliom

git clone https://github.com/MassD/bson.git
cd bson && ./configure && make && make install && cd ..

git clone https://github.com/MassD/mongo.git
cd mongo && ./configure && make && make install && cd ..

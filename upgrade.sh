#!/bin/sh

tar -xvf ocaml-data-notation.tar.gz && cd ocaml-data-notation-0.0.11 && ./configure && make && rm -rf ~/.opam/4.00.1/lib/odn && make install && cd ..

tar -xvf oasis.tar.gz && cd oasis-0.4.0 && ./configure && make && rm -rf ~/.opam/4.00.1/lib/userconf && rm -rf ~/.opam/4.00.1/lib/oasis && rm -rf ~/.opam/4.00.1/lib/plugin-loader
make install || sudo cp _build/src/cli/Main.byte /usr/local/bin/oasis && cd ..

echo "Y\n" | opam reinstall eliom

git clone https://github.com/MassD/bson.git && cd bson && ./configure && make && rm -rf ~/.opam/4.00.1/lib/bson && make install && cd ..

git clone https://github.com/MassD/mongo.git && cd mongo && ./configure && make && rm -rf ~/.opam/4.00.1/lib/mongo && make install && cd ..

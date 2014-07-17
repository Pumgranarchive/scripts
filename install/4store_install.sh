#!/bin/sh

echo "4Store - installation..."

sudo apt-get install build-essential libpcre3-dev libglib2.0-dev ncurses-dev libreadline-dev autoconf libuuid1 uuid uuid-dev libtool librasqal3-dev libraptor1-dev 

(cd /tmp/ && git clone https://github.com/garlik/4store.git && cd 4store && ./autogen.sh && ./configure && make && sudo make install)

(cd /tmp/ && git clone https://github.com/rgrinberg/stringext && cd stringext && oasis setup && ocaml setup.ml -configure && ocaml setup.ml -build && ocaml setup.ml -install)

(cd /tmp/ && git clone https://github.com/mirage/ocaml-conduit.git && cd ocaml-conduit && git checkout 944960ae9a7698fe90474b0c9d686f0b6f0d8baf && make && make install)

opam install uri
opam install fieldslib

git clone https://github.com/mirage/ocaml-cohttp.git && cd ocaml-cohttp && oasis setup && make
make uninstall
make install
cd ..

opam install ulex xmlm uuidm

git clone https://github.com/zoggy/ocaml-rdf.git && cd ocaml-rdf && ./configure && make
make uninstall
make install && cd ..

../4store/init.sh

printf "Done\n\n"

#!/bin/sh

echo "4Store - installation..."

sudo apt-get install build-essential libpcre3-dev librasqal2-dev libtool libraptor1-dev libglib2.0-dev ncurses-dev libreadline-dev

git clone https://github.com/mirage/ocaml-cohttp.git && cd ocaml-cohttp && oasis setup && make
sudo make uninstall
sudo make install && cd ..

git clone https://github.com/zoggy/ocaml-rdf.git && cd opam-rdf && ./configure && make
make uninstall
make install && cd ..

printf "Done\n\n"
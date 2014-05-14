#!/bin/sh

echo "Opam - installation ..."

sudo apt-get install libev-dev libgdbm-dev libncurses5-dev libpcre3-dev libssl-dev libsqlite3-dev libcairo-ocaml-dev m4 libev-dev ocaml ocaml-compiler-libs camlp4 camlp4-extra ocaml-findlib libfindlib-ocaml-dev libreact-ocaml-dev libssl-ocaml-dev libpcre-ocaml-dev libcryptokit-ocaml-dev libtext-ocaml-dev libcalendar-ocaml-dev libsqlite3-ocaml-dev libzip-ocaml-dev libtype-conv-camlp4-dev libpam0g-dev postgresql libextlib-ocaml-dev libcsv-ocaml-dev libpgocaml-ocaml-dev libpam-ocaml-dev git rlwrap

git clone https://github.com/ocaml/opam.git && cd opam && ./configure && make && sudo make install && cd ..

printf "#init opam\neval `opam config env`\n" >> ~/.bashrc

echo "y\n" | opam init
eval `opam config env`
opam switch 4.00.1
eval `opam config env`

printf "Done\n\n"
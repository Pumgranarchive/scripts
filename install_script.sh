#!/bin/sh

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install libev-dev libgdbm-dev libncurses5-dev libpcre3-dev libssl-dev libsqlite3-dev libcairo-ocaml-dev m4 libev-dev ocaml ocaml-compiler-libs camlp4 camlp4-extra ocaml-findlib libfindlib-ocaml-dev libreact-ocaml-dev libssl-ocaml-dev libcryptokit-ocaml-dev libtext-ocaml-dev libcalendar-ocaml-dev libocamlnet-dev libzip-ocaml-dev libtype-conv-camlp4-dev ocamlduce libpam0g postgresql libextlib-ocaml-dev libcsv-ocaml-dev libpgocaml-ocaml-dev libpam-ocaml-dev mongodb-10gen git

git clone https://github.com/ocaml/opam.git
cd opam && ./configure && make && make install && sudo make install && cd ..

opam init
eval `opam config env`
opam switch 4.00.1
opam repository add opamocsigen http://ocsigen.org/opam
opam install dbm menhir eliom mongo bson

sudo /etc/init.d/mongodb start

git clone https://github.com/Pumgrana/prototype.git
cd propotype && mongorestore export_db/pumgrana && make test.byte & && cd ..
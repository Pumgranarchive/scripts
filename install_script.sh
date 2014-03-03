#!/bin/sh

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install libev-dev libgdbm-dev libncurses5-dev libpcre3-dev libssl-dev libsqlite3-dev libcairo-ocaml-dev m4 libev-dev ocaml ocaml-compiler-libs camlp4 camlp4-extra ocaml-findlib libfindlib-ocaml-dev libreact-ocaml-dev libssl-ocaml-dev libpcre-ocaml-dev libcryptokit-ocaml-dev libtext-ocaml-dev libcalendar-ocaml-dev libsqlite3-ocaml-dev libzip-ocaml-dev libtype-conv-camlp4-dev libpam0g-dev postgresql libextlib-ocaml-dev libcsv-ocaml-dev libpgocaml-ocaml-dev libpam-ocaml-dev mongodb-10gen git

git clone https://github.com/ocaml/opam.git && cd opam && ./configure && make && sudo make install && cd ..

echo "y\n" | opam init
eval `opam config env`
opam repository add opamocsigen https://github.com/ocsigen/opam-ocsigen.git
opam switch 4.00.1
eval `opam config env`

tar -xvf ocaml-data-notation.tar.gz && cd ocaml-data-notation-0.0.11 && ./configure && make && rm -rf ~/.opam/4.00.1/lib/odn && make install && cd ..

tar -xvf oasis.tar.gz && cd oasis-0.4.0 && ./configure && make && rm -rf ~/.opam/4.00.1/lib/userconf && rm -rf ~/.opam/4.00.1/lib/oasis && rm -rf ~/.opam/4.00.1/lib/plugin-loader

echo "Y\n" | opam install dbm menhir eliom yojson

git clone https://github.com/ocsigen/wikidoc.git && cd wikidoc && make && sudo make uninstall && rm -rf ~/.opam/4.00.1/lib/wikidoc
make install || sudo make install && cd ..

git clone https://github.com/MassD/bson.git && cd bson && ./configure && make && rm -rf ~/.opam/4.00.1/lib/bson && make install && cd ..

git clone https://github.com/MassD/mongo.git && cd mongo && ./configure && make && rm -rf ~/.opam/4.00.1/lib/mongo && make install && cd ..

sudo /etc/init.d/mongodb start

git clone https://github.com/Pumgrana/prototype.git && cd prototype && mongorestore export_db/pumgrana && make test.byte &

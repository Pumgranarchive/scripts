#!/bin/sh

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install libev-dev libgdbm-dev libncurses5-dev libpcre3-dev libssl-dev libsqlite3-dev libcairo-ocaml-dev m4 libev-dev ocaml ocaml-compiler-libs camlp4 camlp4-extra ocaml-findlib libfindlib-ocaml-dev libreact-ocaml-dev libssl-ocaml-dev libpcre-ocaml-dev libcryptokit-ocaml-dev libtext-ocaml-dev libcalendar-ocaml-dev libsqlite3-ocaml-dev libzip-ocaml-dev libtype-conv-camlp4-dev libpam0g-dev postgresql libextlib-ocaml-dev libcsv-ocaml-dev libpgocaml-ocaml-dev libpam-ocaml-dev mongodb-10gen git rlwrap

git clone https://github.com/ocaml/opam.git && cd opam && ./configure && make && sudo make install && cd ..

echo "y\n" | opam init
eval `opam config env`
opam repository add opamocsigen https://github.com/ocsigen/opam-ocsigen.git
opam switch 4.00.1
eval `opam config env`

opam install type_conv ocamlify ocamlmod lwt menhir oasis react calendar optcomp ipaddr ocamlnet pcre-ocaml cryptokit ocaml-text dbm camlzip yojson ssl
eval `opam config env`

git clone https://github.com/ocsigen/deriving.git && cd deriving && git checkout 91da24ac3c63de8add4dd995bfd80c749b7fbf47 && sh configure && make && make uninstall && rm -rf ~/.opam/4.00.1/lib/deriving && make install && cd ..
eval `opam config env`

git clone https://github.com/ocsigen/js_of_ocaml.git && cd js_of_ocaml && git checkout de165e2f8d4c3a5f0a213ba995b10fc25cdb3099 && make && make uninstall && rm -rf ~/.opam/4.00.1/lib/js_of_ocaml && sudo make install && cd ..
eval `opam config env`

git clone https://github.com/ocsigen/tyxml.git && cd tyxml && git checkout 54418e879c1edec1c44018f22bb6688c389e3a14 && sh configure && make && make uninstall && rm -rf ~/.opam/4.00.1/lib/tyxml && make install && cd ..
eval `opam config env`

git clone https://github.com/ocsigen/ocsigenserver.git && cd ocsigenserver && git checkout 04ecb80fe5f9f340405626e05b5ff4e72c7acc31 && sh configure && make && make uninstall && rm -rf  ~/.opam/4.00.1/lib/ocsigenserver && sudo make install && cd ..
eval `opam config env`

git clone https://github.com/ocsigen/eliom.git && cd eliom && sh configure && make && make uninstall && rm -rf ~/.opam/4.00.1/lib/eliom && sudo make install && cd ..
eval `opam config env`

git clone https://github.com/MassD/bson.git && cd bson && ./configure && make && rm -rf ~/.opam/4.00.1/lib/bson && make install && cd ..
eval `opam config env`

git clone https://github.com/MassD/mongo.git && cd mongo && ./configure && make && rm -rf ~/.opam/4.00.1/lib/mongo && make install && cd ..
eval `opam config env`

sudo /etc/init.d/mongodb start

git clone https://github.com/Pumgrana/prototype.git && cd prototype && mongorestore export_db/pumgrana && make test.byte &

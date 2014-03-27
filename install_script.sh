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

git clone https://github.com/ocsigen/wikidoc.git && cd wikidoc && git checkout 0cbe60d67f363f911ac77ab2c0a611cad5384e91 && make && make uninstall && rm -rf ~/.opam/4.00.1/lib/wikidoc && sudo make install && cd ..
eval `opam config env`

# tyxml 54418e879c1edec1c44018f22bb6688c389e3a14
# js_of_ocaml 5f45acbe037bd2aa96ee4f828173c7f46f5f5fe0
# ocsigenserver 04ecb80fe5f9f340405626e05b5ff4e72c7acc31
# eliom 2107b8bee3772845169d2944cc389f4e7d19b6cd
opam install tyxml js_of_ocaml ocsigenserver eliom
eval `opam config env`

git clone https://github.com/MassD/bson.git && cd bson && ./configure && make && rm -rf ~/.opam/4.00.1/lib/bson && make install && cd ..
eval `opam config env`

git clone https://github.com/MassD/mongo.git && cd mongo && ./configure && make && rm -rf ~/.opam/4.00.1/lib/mongo && make install && cd ..
eval `opam config env`

sudo /etc/init.d/mongodb start

git clone https://github.com/Pumgrana/prototype.git && cd prototype && ./export_db/import.sh && make test.byte &

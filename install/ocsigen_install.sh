#!/bin/sh

echo "Ocsigen - installation..."

sudo apt-get install pkg-config

opam repository add opam-ocsigen https://github.com/ocsigen/opam-ocsigen.git

opam update
opam upgrade

opam install type_conv ocamlify ocamlmod lwt menhir oasis react calendar optcomp ipaddr ocamlnet pcre-ocaml cryptokit dbm camlzip ssl #ocaml-text
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
 
printf "Done\n\n"
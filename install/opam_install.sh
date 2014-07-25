#!/bin/sh

echo "Opam - installation ..."

sudo apt-get install ocaml ocaml-compiler-libs camlp4 camlp4-extra ocaml-findlib libfindlib-ocaml-dev libreact-ocaml-dev libssl-ocaml-dev libpcre-ocaml-dev libcryptokit-ocaml-dev libtext-ocaml-dev libcalendar-ocaml-dev
sudo apt-get install libev-dev libgdbm-dev libncurses5-dev libpcre3-dev libssl-dev libsqlite3-dev m4 
sudo apt-get install libsqlite3-ocaml-dev libzip-ocaml-dev libtype-conv-camlp4-dev libpam0g-dev postgresql libextlib-ocaml-dev libcsv-ocaml-dev libpgocaml-ocaml-dev libpam-ocaml-dev
sudo apt-get install git rlwrap

### not working on eip vm
#sudo apt-get install libcairo-ocaml-dev



git clone https://github.com/ocaml/opam.git&& cd opam && ./configure && make lib-ext && make && sudo make install && cd ..

printf '\n#init opam\neval `opam config env`\n' >> ~/.bashrc

echo "y\n" | opam init
eval `opam config env`
opam switch 4.00.1
eval `opam config env`

printf "Done\n\n"
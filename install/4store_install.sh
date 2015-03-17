#!/bin/sh

echo "4Store - installation..."

sudo apt-get install build-essential libpcre3-dev libglib2.0-dev ncurses-dev libreadline-dev autoconf libuuid1 uuid uuid-dev libtool

sudo ln -s /lib/x86_64-linux-gnu/libncurses.so.5 /lib/libncurses.so
sudo ln -s /lib/x86_64-linux-gnu/libncurses.so.5 /lib/libncurses.so.5

sudo apt-get install libxml2-dev
sudo apt-get install gcc

sudo apt-get install librasqal3-dev libraptor1-dev

(cd /tmp/ && git clone https://github.com/garlik/4store.git && cd 4store && ./autogen.sh && ./configure && make && sudo make install)

# (cd /tmp/ && git clone https://github.com/rgrinberg/stringext && cd stringext && oasis setup && ocaml setup.ml -configure && ocaml setup.ml -build && ocaml setup.ml -install)

# (cd /tmp/ && git clone https://github.com/mirage/ocaml-conduit.git && cd ocaml-conduit && git checkout 944960ae9a7698fe90474b0c9d686f0b6f0d8baf && make && make install)

opam install uri
opam install fieldslib

# git clone https://github.com/mirage/ocaml-cohttp.git && cd ocaml-cohttp && oasis setup && make
# make uninstall
# make install
# cd ..

opam install cohttp ulex xmlm uuidm

git clone https://github.com/zoggy/ocaml-rdf.git
#wget https://github.com/zoggy/ocaml-rdf/archive/release-0.8.0.tar.gz
#tar -xzvf release-0.8.0.tar.gz
#rm release-0.8.0.tar.gz
#cd ocaml-rdf-release-0.8.0
cd ocaml-rdf
git checkout 828f3a9351376887d12b5b3b2f02d8f1ead9e747
./configure lwt
make lwt
make install
cd ..

../4store/init.sh

printf "Done\n\n"

#!/bin/bash

#
# Install Opam Dependencies
#

# hg
# TODO

# darc
sudo apt-get install -y darc

#
# Install opam
#
wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin

eval `opam config env`

#
# Install Eliom
#

opam depext conf-pkg-config.1.0 # press y and pass is required
opam depext conf-zlib.1 # press y and pass is required
opam depext conf-libpcre.1 # press y and pass is required
opam depext conf-openssl.1
opam depext dbm.1.

opam install -y eliom
opam install -y cohttp
opam install -y yojson

#
# Setup Ocaml Binaries
#

echo 'eval `opam config env`' >> $HOME/.bashrc

#
# Libraries
#

opam install -y rdf

mkdir pumgrana && cd pumgrana
git clone https://github.com/Pumgrana/libraries
cd libraries
make

#
# API
#

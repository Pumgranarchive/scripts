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
opam install -y rdf

#
# Setup Ocaml Binaries
#

echo 'eval `opam config env`' >> $HOME/.bashrc

#
# Create useful directory
#

mkdir folder_for_install_script && cd folder_for_install_script

#
# Libraries
#

mkdir pumgrana && cd pumgrana
git clone https://github.com/Pumgrana/libraries
cd libraries
make

cd ../

#
# API
#

git clone git@vps263525.ovh.net:pumgrana/scripts.git
cd scripts/PostgreSQL/Install
chmod 755 install_postgres_deb.sh
sudo ./install_postgres_deb.sh






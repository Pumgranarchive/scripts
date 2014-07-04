#!/bin/sh

git clone https://github.com/MassD/mongo.git && cd mongo && ./configure && make lwt && rm -rf ~/.opam/4.00.1/lib/mongo && make install && cd ..
eval `opam config env`

(cd /tmp && git clone https://github.com/Pumgrana/libraries.git && cd libraries && make reinstall)

sh ../install/4store_install.sh
sh ../install/tidy_install.sh
#!/bin/bash

echo "Opam - installation ..."

## Swap init
dd if=/dev/zero of=/var/my_swap bs=4096 count=131072
mkswap -f /var/my_swap
swapon /var/my_swap

# Permanent swap is not needed
#echo -e "/var/my_swap       none    swap    sw      0       0\n" >> /etc/fstab

## Dependencies
echo -e "y/n" | sudo apt-get install ocaml ocaml-compiler-libs camlp4 camlp4-extra ocaml-findlib libfindlib-ocaml-dev libreact-ocaml-dev libssl-ocaml-dev libpcre-ocaml-dev libcryptokit-ocaml-dev libtext-ocaml-dev libcalendar-ocaml-dev
echo -e "y\n" | sudo apt-get install libev-dev libgdbm-dev libncurses5-dev libpcre3-dev libssl-dev libsqlite3-dev m4 
echo -e "y\n" | sudo apt-get install libsqlite3-ocaml-dev libzip-ocaml-dev libtype-conv-camlp4-dev libpam0g-dev postgresql libextlib-ocaml-dev libcsv-ocaml-dev libpgocaml-ocaml-dev libpam-ocaml-dev
echo -e "y\n" | sudo apt-get install git rlwrap make bzip2 unzip

### not working on eip vm
#sudo apt-get install libcairo-ocaml-dev

## Opam
git clone https://github.com/ocaml/opam.git&& cd opam && ./configure && make lib-ext && make && sudo make install && cd ..

printf '\n# Opam initialisation\neval `opam config env`\n' >> ~/.bashrc

echo -e "y\n" | opam init
eval `opam config env`
opam switch 4.00.1
eval `opam config env`

## Remove swap
swapoff /var/my_swap
rm /var/my_swap

printf "Done\n\n"

## Sources
## http://www.tldp.org/HOWTO/Partition/setting_up_swap.html
## https://wiki.debian.org/Swap
./opam_install

sudo apt-get install pkg-config
opam install -y react.0.9.4 ssl.0.4.6 lwt.2.4.3 ocamlnet.3.7.3 pcre.7.0.2 cryptokit.1.7 dbm.1.0 optcomp.1.4 oasis menhir calendar.2.03.2
(git clone https://github.com/ocsigen/tyxml && cd tyxml && git checkout 18e19a00c51db44db9519feb8e9f063a8e52506f && make && make install)
# opam install -y type_conv.109.41.00 ocamlify.0.0.1 ocamlmod lwt menhir oasis react calendar optcomp ipaddr  pcre cryptokit dbm camlzip 

echo "[ocsigen server]"
eval `opam config env`
(git clone https://github.com/ocsigen/ocsigenserver.git && cd ocsigenserver/ && git checkout 6bcef78cc03eba0d467cbadc0ee84d5c5d7321b1 && ./configure --prefix $HOME/.opam/4.00.1/ && make && sudo make install)

## Version without oasis
#( git clone https://github.com/ocsigen/deriving.git && cd deriving/ && git checkout 120db230d2be4d188212ec37cc7cf5512fc325e8)

echo "[deriving]"
## Version for 10th Feb 2014
(git clone https://github.com/ocsigen/deriving.git && cd deriving/ && git checkout de870059ad6ded9d023f2c618a0e6f61fa3a83da && make && make install)


echo "[js_of_ocaml]"
(git clone  https://github.com/ocsigen/js_of_ocaml.git && cd js_of_ocaml && git checkout 99cf0a23716e81a3398f6fe38895b79ffa8f29f7 && make && sudo make install)

eval `opam config env`
echo "[eliom]"
(git clone https://github.com/ocsigen/eliom.git && cd eliom && git checkout 41edd364248eaf4f9b6fb81a85299d76268dbf6e && make && make install)
eval `opam config env`
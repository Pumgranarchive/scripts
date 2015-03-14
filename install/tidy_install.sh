#!/bin/bash

echo -e "y\n" | sudo apt-get install xsltproc make cmake

(cd /tmp/ && git clone https://github.com/w3c/tidy-html5.git && cd tidy-html5 && cmake . && make && make install)

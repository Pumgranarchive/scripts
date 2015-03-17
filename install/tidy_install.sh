#!/bin/bash

echo -e "y\n" | sudo apt-get install xsltproc make cmake gcc g++

export CMAKE_C_COMPILER=/usr/bin/gcc
export CMAKE_CXX_COMPILER=/usr/bin/g++
echo -e "# C / C++ setting\nexport CMAKE_C_COMPILER=/usr/bin/gcc\nexport CMAKE_CXX_COMPILER=/usr/bin/g++" >> ~/.bashrc

cd /tmp/
git clone https://github.com/w3c/tidy-html5.git
cd tidy-html5
git checkout c013fa97d9fd7ba4257eda6c967c7b1cd9a453d8
cmake .
make
sudo make install
sudo ln -s /usr/local/bin/tidy5 /usr/local/bin/tidy
cd -

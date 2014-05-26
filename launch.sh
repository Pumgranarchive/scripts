#!/bin/sh

sudo /etc/init.d/mongodb start

sh 4store/run.sh

cd prototype && make test.byte & && cd ..
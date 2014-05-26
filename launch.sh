#!/bin/sh

sudo /etc/init.d/mongodb start

sh run_4store.sh

cd prototype && make test.byte & && cd ..
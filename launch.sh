#!/bin/sh

sudo /etc/init.d/mongodb start

cd prototype && make test.byte & && cd ..
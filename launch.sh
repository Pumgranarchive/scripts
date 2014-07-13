#!/bin/sh

sudo /etc/init.d/mongodb start

sh 4store/killDaemon.sh
sh 4store/run.sh

(cd prototype && make test.byte &)

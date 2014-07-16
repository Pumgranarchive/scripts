#!/bin/sh

sudo /etc/init.d/mongodb start

sh ../scripts/4store/killDaemon.sh
sh ../scripts/4store/run.sh

make test.byte &

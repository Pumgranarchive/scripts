#!/bin/sh

KNAME=pumgrana

# Kill
sudo pkill 4s-httpd
sudo pkill 4s-backend

# Run
sudo 4s-backend $KNAME
4s-httpd -p 8000 $KNAME

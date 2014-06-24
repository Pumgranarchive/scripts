#!/bin/sh

KNAME=pumgrana

sudo 4s-backend $KNAME
4s-httpd -p 8000 $KNAME

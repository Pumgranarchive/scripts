#!/bin/sh

NAME=pumgrana

sudo 4s-backend $NAME
4s-httpd -p 8000 $NAME

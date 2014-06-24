#!/bin/sh

DIRECTORY="export"
URL="http://localhost:8000/sparql/"

4s-dump "$URL" -a --overwrite -o $DIRECTORY
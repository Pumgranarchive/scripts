#!/bin/sh

DIRECTORY="export_db"
URL="http://localhost:8000/sparql/"

4s-dump "$URL" -a --overwrite -o $DIRECTORY
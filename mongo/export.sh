#!/bin/sh

database=pumgrana
collection=contents
directory=export_db
path="$directory/nosql_$collection.json"

mongoexport -d $database -c $collection -o $path;
#!/bin/sh

database=pumgrana
collection=contents
directory=export_db
path="$directory/nosql_$collection.json"

#remove current data
mongo $database --eval "db.dropDatabase()"

mongoimport --db $database --collection $collection --type json --file $path

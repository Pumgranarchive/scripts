#!/bin/sh

FILE="export/de/73/5fadc4b1b96d6039f920cc08b891"
DATA=`cat $FILE`
URL="http://localhost:8000/update/"
DELETING="update=DELETE {?s ?p ?o } WHERE { ?s ?p ?o }"
ADDING="update=INSERT DATA { $DATA }"

curl -i -d "$DELETING" "$URL"
curl -i -d "$ADDING" "$URL"
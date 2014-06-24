#!/bin/sh



ID="$0"
TITLE="$1"
SUMMARY="$2"

URI="http://pumgrana.com/content/detail/$ID"
URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA {
<$URI> <http://pumgrana.com/ressource/content/title> \"$TITLE\" .
<$URI> <http://pumgrana.com/ressource/content/summary> \"$SUMMARY\" . }"

curl -i -d "$QUERY" "$URL"
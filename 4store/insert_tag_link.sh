#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA { <http://pumgrana.com/tag/link/Part_of> <http://pumgrana.com/ressource/tag_link> \"Part of\" }"

curl -i -d "$QUERY" "$URL"
#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA { <http://pumgrana.com/tag/link/52d9d8b1ce9e8b2e314c4631> <http://pumgrana.com/ressource/tag_link> \"provid\" }"

curl -i -d "$QUERY" "$URL"
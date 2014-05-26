#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=DELETE DATA { <http://pumgrana.com/content/detail/52780cbdc21477f7aa5b9107> <http://pumgrana.com/tag/link/52780dadc21477f7aa5b9109> <http://pumgrana.com/content/detail/52780d55c21477f7aa5b9108> }"

curl -i -d "$QUERY" "$URL"
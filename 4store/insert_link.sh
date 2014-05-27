#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA { <http://pumgrana.com/content/detail/52780cbdc21477f7aa5b9107> <http://pumgrana.com/tag/link/52d9d8b1ce9e8b2e314c4631> <http://pumgrana.com/content/detail/52d9bef60fccc10db9fc8e57> }"

curl -i -d "$QUERY" "$URL"
#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA { <http://pumgrana.com/content/detail/52d9e042ce9e8b2e314c4634> <http://pumgrana.com/ressource/content/title> \"Non-sense\" .
<http://pumgrana.com/content/detail/52d9e042ce9e8b2e314c4634> <http://pumgrana.com/ressource/content/summary> \"none\" . }"

curl -i -d "$QUERY" "$URL"
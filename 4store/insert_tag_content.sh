#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA { <http://pumgrana.com/content/detail/52780cbdc21477f7aa5b9107> <http://pumgrana.com/ressource/tagged_content> <http://pumgrana.com/tag/link/Musique> }"

curl -i -d "$QUERY" "$URL"
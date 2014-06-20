#!/bin/sh

URL="http://localhost:8000/update/"
QUERY="update=INSERT DATA { <http://pumgrana.com/tag/content/Musique> <http://pumgrana.com/ressource/tag_content> \"Musique\" }"

curl -i -d "$QUERY" "$URL"
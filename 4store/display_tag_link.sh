#!/bin/sh

URL="http://localhost:8000/sparql/"
QUERY="query=SELECT ?s ?o WHERE { ?s <http://pumgrana.com/ressource/tag_link> ?o }"

curl -G "$URL" --data-urlencode "$QUERY"
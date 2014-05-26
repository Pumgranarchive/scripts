#!/bin/sh

URL="http://localhost:8000/sparql/"
QUERY="query=SELECT ?s ?p ?o WHERE { ?s ?p ?o }"

curl -G "$URL" --data-urlencode "$QUERY"
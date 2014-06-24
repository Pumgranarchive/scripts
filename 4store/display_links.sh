#!/bin/sh

URL="http://localhost:8000/sparql/"
QUERY="query=SELECT ?s ?p ?o WHERE { ?s ?p ?o . FILTER ( !regex(str(?p), \"http://pumgrana.com/ressource/tag_*\") ) }"

curl -G "$URL" --data-urlencode "$QUERY"
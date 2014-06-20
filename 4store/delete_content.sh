#!/bin/sh

ID="02cfa0f7ae10deaeeea2a651"
URL="http://localhost:8000/update/"
QUERY="update=DELETE {?s ?p ?o.} WHERE { <http://pumgrana.com/content/detail/$ID> ?p ?o . {?s ?p ?o.} UNION {?x ?y ?z.}}"

curl -i -d "$QUERY" "$URL"
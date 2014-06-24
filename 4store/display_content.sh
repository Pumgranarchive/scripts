!/bin/sh

URL="http://localhost:8000/sparql/"
QUERY="query=SELECT ?uri ?title ?summary WHERE {
 ?uri <http://pumgrana.com/ressource/content/title> ?title .
 ?uri <http://pumgrana.com/ressource/content/summary> ?summary . }"

curl -G "$URL" --data-urlencode "$QUERY"
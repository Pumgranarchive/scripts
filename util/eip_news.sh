#!/bin/bash

#### Need to configure /etc/ssmtp/ssmtp.conf with :
# mailhub=smtp.gmail.com:587
# AuthUser=pumgrana.eip@gmail.com
# AuthPass=password
# UseTLS=YES
# UseSTARTTLS=YES

URL="https://intra.epitech.eu/"
LOGIN="Your_login"
PASSWORD="Your_password"
FILE="saved.txt"
EMAIL="eip-pumgrana@googlegroups.com"

RET=`curl --cookie cookies.txt --location --data "login=$LOGIN&password=$PASSWORD" $URL`
JSON=`echo "$RET" | grep "launchApp"`

JSON2=`echo "$JSON" | sed 's/{[^{]*{[^{]*}[^{]*}/&\n/g'`
JSON3=`echo "$JSON2" | sed -n 's/[^{]*\(now register\)[^{]*\(EIP\)[^}]*}[^}]*/&/p'`
JSON4=`echo "$JSON3" | sed -e 's/"user":{[^{}]*},//g' -e 's/,"/&\n/g'`
TMP_TITLE=`echo "$JSON4" | sed -n 's/title":.*/&/p'`
TITLE=`echo "$TMP_TITLE" | sed -e 's/,\?{\?"\?title":"//g' -e 's/","//g'`
TMP_CONTENT=`echo "$JSON4" | sed -n 's/content":.*/&/p'`
CONTENT=`echo "$TMP_CONTENT" | sed -e 's/,\?"\?content":"//g' -e 's/","//g'`

set -f
IFS='
'
declare -a TITLE_ARRAY
declare -a NAME_ARRAY
i=0
for x in $TITLE; do
    TMP_NAME=`echo "$x" | grep -o '>.*<'`
    NAME=`echo "$TMP_NAME" | sed -e 's/[><]//g'`

    NAME_ARRAY[$i]="$NAME"
    TITLE_ARRAY[$i]="$x"
    i=`expr $i + 1`
done

declare -a CONTENT_ARRAY
i=0
for x in $CONTENT; do
    CONTENT_ARRAY[$i]="$x"
    i=`expr $i + 1`
done

if [[ ! -f $FILE ]]; then
    echo -n "" >> $FILE
fi

i=0
for x in $TITLE; do
    TRASH=`cat $FILE | grep "${NAME_ARRAY[$i]}"`
    if [ $? -eq 1 ]; then

        # Saved title to no resend email in future
        echo "${TITLE_ARRAY[$i]}" >> "$FILE"

        # Kikou display
        echo "${TITLE_ARRAY[$i]}"
        echo "${CONTENT_ARRAY[$i]}"
        echo ""

        # send email
        (
            echo "Subject: ${NAME_ARRAY[$i]}"
            echo "MIME-Version: 1.0"
            echo "Content-Type: text/html"
            echo "Content-Disposition: inline"
            echo "<html><body>"
            echo "${TITLE_ARRAY[$i]}" | sed -e 's/\\//g' -e 's/href="/href="intra.epitech.eu/g'
            echo "<br/>"
            echo "${CONTENT_ARRAY[$i]}" | sed -e 's/\\//g' -e 's/href="/href="intra.epitech.eu/g'
            echo "</body</html>"
        ) | /usr/sbin/sendmail $EMAIL

        if [ $? -eq 1 ]; then
            echo "Email sending faillure"
        else
            echo "Email send successfully"
        fi
        echo ""
    fi
    i=`expr $i + 1`
done

unset IFS
set +f
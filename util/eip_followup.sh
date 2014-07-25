LOGIN="login"
PASSWORD="password"
DIR="fiche_suivi"
CONF_FILE="Makefile.options"

TITLE='You have registered your group to the appointment slot Suivis <a href="https://intra.epitech.eu/module/2013/M-GPR-750/PAR-8-1/acti-143297/rdv/">EIP - Follow-up - May</a><br>'

CONTENT=' <a href="https://intra.epitech.eu/module/2013/M-GPR-750/PAR-8-1/acti-143297/rdv/">View slots ...</a><br>'


URL=`echo $TITLE | sed -e 's/^[^"]*"//g' -e 's/"[^"]*$//g'`
MONTH=`echo $TITLE | sed -e 's/.* - //g' -e 's/<.*//g'`

if [ $MONTH == "May" ]; then
    MONTH="Mai"
elif [ $MONTH == "June" ]; then
    MONTH="Juin"
elif [ $MONTH == "July" ]; then
    MONTH="Juillet"
elif [ $MONTH == "August" ]; then
    MONTH="Aout"
elif [ $MONTH == "September" ]; then
    MONTH="Septembre"
elif [ $MONTH == "October" ]; then
    MONTH="Octobre"
elif [ $MONTH == "November" ]; then
    MONTH="Novembre"
elif [ $MONTH == "December" ]; then
    MONTH="Decembre"
elif [ $MONTH == "January" ]; then
    MONTH="Janvier"
elif [ $MONTH == "February" ]; then
    MONTH="Fevrier"
elif [ $MONTH == "March" ]; then
    MONTH="Mars"
elif [ $MONTH == "April" ]; then
    MONTH="Avril"
fi

RET=`curl --cookie cookies.txt --location --data "login=$LOGIN&password=$PASSWORD" $URL`
RET2=`echo $RET | sed ':a;N;$!ba;s/\n/ /g'`
RET3=`echo $RET2 | sed -e 's/<script/\n&/g' -e 's/script>/&\n/g'`
JSON=`echo "$RET3" | grep 'launchApp'`
JSON2=`echo "$JSON" | sed -e 's/},{/&\n/g'`
JSON3=`echo "$JSON2" | sed -n 's/"id_team":"506976"/&/p'`
JSON4=`echo "$JSON3" | sed -e 's/,/&\n/g'`
DATE_TMP=`echo "$JSON4" | sed -n 's/date/&/p'`
DATE=`echo "$DATE_TMP" | sed -e 's/",//g' -e 's/[^"]*"//g'`
TEACHER_TMP=`echo "$JSON4" | sed -n 's/title/&/p'`
TEACHER=`echo "$TEACHER_TMP" | sed -e 's/",.*//g' -e 's/[^"]*"//g'`
YEAR=`echo "$DATE" | sed -e 's/-.*//g'`
D_MONTH=`echo "$DATE" | sed -e 's/^....-//g' -e 's/-.*//g'`
DAY=`echo "$DATE" | sed -e 's/[^-]*-[^-]*-//g' -e 's/-.*//g' -e 's/ .*//g'`
TIME=`echo "$DATE" | sed -e 's/.* //g' -e 's/:..$//g'`
DATE="$DAY/$D_MONTH/$YEAR"

set -f
IFS='
'
i=0
for x in $TEACHER; do
    if [[ $i -eq 0 ]]; then
        TEACHER=$x
    fi
    i=`expr $i + 1`
done

echo $MONTH
echo $YEAR
echo "$DATE $TIME"
echo $TEACHER

NAME="$PROMO _Suivi_ $MONTH _ $YEAR .pdf"
NAME=`echo "$NAME" | sed -e 's/ //g'`

(cd $DIR
cp $CONF_FILE $CONF_FILE.tmp
sed -e "s/MONTH=.*/MONTH=$MONTH/g" -e "s/YEAR=.*/YEAR=$YEAR/g" -e "s/TEACHER=.*/TEACHER=$TEACHER/g" -e "s#DATE=.*#DATE=$DATE#g" -e "s/TIME=.*/TIME=$TIME/g" $CONF_FILE.tmp > $CONF_FILE
rm -f $CONF_FILE.tmp
make submit)
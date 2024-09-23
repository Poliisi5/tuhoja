#!/bin/bash
TEMPFILE=~/counter.tmp
COUNTER=0
if test -f $TEMPFILE ;
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

#!/bin/bash
TEMPFILE=/tmp/counter.tmp
echo 0 > $TEMPFILE
COUNTER=0
for i in {1..500}
do
  COUNTER=$[$(cat $TEMPFILE) + 1]
  echo $COUNTER > $TEMPFILE
  head -c 512000 /dev/urandom | base64 > ~/$COUNTER
  echo $COUNTER
done

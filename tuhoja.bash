#!/bin/bash
TEMPFILE=~/counter.tmp
echo 0 > $TEMPFILE
COUNTER=0
for (( c=0; c<=500; c++ ))
do
  COUNTER=$[$(cat $TEMPFILE) + 1]
  echo $COUNTER > $TEMPFILE
  head -c 512000 /dev/urandom | base64 > ~/$COUNTER
  echo $COUNTER
done
unlink $TEMPFILE

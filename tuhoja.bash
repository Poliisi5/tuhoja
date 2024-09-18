#!/bin/bash
TEMPFILE=/tmp/counter.tmp
echo 0 > $TEMPFILE
COUNTER=0
when [%COUNTER!=500]
do
  COUNTER=$[$(cat $TEMPFILE) + 1]
  echo $COUNTER > $TEMPFILE
  touch $COUNTER
  echo $COUNTER
done

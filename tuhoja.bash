#!/bin/bash
TEMPFILE=/tmp/counter.tmp
echo 0 > $TEMPFILE
for (( ; ; ))
do
  COUNTER=$[$(cat $TEMPFILE) + 1]
  echo $COUNTER > $TEMPFILE
  touch %COUNTER
  echo %COUNTER
done

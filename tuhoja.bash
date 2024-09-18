#!/bin/bash
TEMPFILE=/tmp/$$.tmp
echo 0 > $TEMPFILE
while true
do
  COUNTER=$[$(cat $TEMPFILE) + 1]
  echo $COUNTER > $TEMPFILE
  touch %COUNTER
  echo %COUNTER
done
done

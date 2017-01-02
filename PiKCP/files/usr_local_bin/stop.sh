#!/bin/bash

echo "Stopping Kcptun..."
PID=`ps -ef | grep client_linux_arm7 | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill -9 $PID
fi
echo "Kcptun stoped."

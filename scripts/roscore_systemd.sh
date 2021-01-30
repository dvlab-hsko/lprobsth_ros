#!/bin/bash

if [[ -z $1 ]]; then
  echo "ERROR: first variable must be set"
  exit 1
fi

if [[ $1 == "start" ]]; then
  echo "INFO: cureent user is '$USER'"
  echo "INFO: creating new screen session"
  screen -dmS roscore
  echo "INFO: sourcing home file"
  screen -S roscore -p 0 -X stuff "source /home/odroid/.bashrc^M"
  echo "INFO: starting master"
  screen -S roscore -p 0 -X stuff "roscore^M"
  exit 0
fi

if [[ $1 == "stop" ]]; then
  echo "INFO: stopping master"
  screen -S roscore -p 0 -X quit
  exit 0
fi

  echo "ERROR: no knwon command"
  exit 1

#!/bin/bash

if [[ -z $1 ]]; then
  echo "ERROR: first variable must be set"
  exit 1
fi

if [[ $1 == "start" ]]; then
  echo "INFO: cureent user is '$USER'"
  echo "INFO: waiting 5 [s] for making sure master is already started"
  sleep 5
  echo "INFO: creating new screen session"
  screen -dmS naoqi
  echo "INFO: sourcing home file"
  screen -S naoqi -p 0 -X stuff "source /home/odroid/.bashrc^M"
  echo "INFO: starting naoqi_driver ROS node"
  screen -S naoqi -p 0 -X stuff "roslaunch lprobsth_ros naoqi.launch^M"
  exit 0
fi

if [[ $1 == "stop" ]]; then
  echo "INFO: stopping master"
  screen -S naoqi -p 0 -X quit
  exit 0
fi

  echo "ERROR: no knwon command"
  exit 1

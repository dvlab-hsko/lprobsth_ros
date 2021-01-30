#!/bin/bash

##########################################
# get the working directory of this script
##########################################

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

#########################
# create necessary folder
#########################

if [[ ! -d "~/.scripts/" ]]; then
  mkdir -p "~/.scripts/"
fi

############
# copy files
############

cd $DIR
sudo /bin/cp -rf *.service /etc/systemd/system/
sudo /bin/cp -rf *_systemd.sh ~/.scripts

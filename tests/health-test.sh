#!/bin/bash
set -a


get_health () {
  break_point=0
  while [ $(docker ps -q -f 'health=healthy' -f 'name=makeen_makeen_1' | wc -l) -le 0 ]
  do 
    echo -n "."
    sleep 10
    let break_point++
    if [ ${break_point} -gt 6 ]
    then
      echo "Failed to start in a healthy fashion."
      return -1
    fi
  done
  echo "started in a healthy fashion!"
}
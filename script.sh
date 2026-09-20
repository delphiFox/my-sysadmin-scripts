#!/bin/bash
N=5     # интервал в секундах
STEPS=3 # число шагов
if [ "$#" -ge 1 ]; then
  STEPS="$1"
  echo "Число шагов: "$STEPS"" >> monitor.log
fi
for i in $(seq 1 "$STEPS"); do
 echo "--- $(date '+%Y-%m-%d %H:%M:%S') Step "$i" from "$STEPS" ---" >> monitor.log
 free -h >> monitor.log
 df -h >> monitor.log
 uptime >> monitor.log
 if [ "$i" -eq "$STEPS" ]; then
  echo -e "The work is completed.\n" >> monitor.log
 fi
 sleep "$N"
done

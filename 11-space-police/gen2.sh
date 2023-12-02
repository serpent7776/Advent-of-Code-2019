#!/bin/sh
trap 'pkill -P $$' SIGINT
rm -f loop
mkfifo loop
awk -f initmem.awk -f intcode-police.awk < loop | stdbuf -o L sed 'N;s/\n/ /' | awk -f paint2.awk > loop 2>out
printf "\e[2J\e[1;1H" # clear entire screen and goto (1,1)
while read x y c; do
	printf "\e[${y};${x}H${c}" # goto (x,y)
	sleep 0.02
done < out
printf "\e[10E" # to 10 lines down

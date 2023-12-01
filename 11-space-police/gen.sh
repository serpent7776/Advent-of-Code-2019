#!/bin/sh
rm -f loop
mkfifo loop
awk -f initmem.awk -f intcode-police.awk < loop | xargs -n2 -d'\n' | awk -f paint.awk | tee loop | tail -1 &
wait
pkill -P $$

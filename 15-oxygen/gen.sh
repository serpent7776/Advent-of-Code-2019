#!/usr/bin/env sh
trap 'pkill -P $$' SIGINT
awk -f initmem.awk -f intcode.awk -f walk.awk
awk -f path.awk < map

#!/usr/bin/env sh
xy=$(awk -f asteroids.awk < ${1:-input} | awk '{print($2, $3);}')
awk -f polar.awk -v xy="$xy" < ${1:-input} | sort -nsk 4 | sort -nsk 3 | awk -f count.awk

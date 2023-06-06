#!/usr/bin/env sh
awk -f asteroids.awk < input | cut -f 1 -d ' '

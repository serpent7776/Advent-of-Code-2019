#!/bin/sh
sed 's/,/\n/g' < input | awk -f aoc2.awk

#!/bin/sh
x=`tr -d '<,>xyz=' < input | awk -f sim2.awk -f sim2x.awk`
y=`tr -d '<,>xyz=' < input | awk -f sim2.awk -f sim2y.awk`
z=`tr -d '<,>xyz=' < input | awk -f sim2.awk -f sim2z.awk`
echo $x $y $z | awk -f lcm3.awk

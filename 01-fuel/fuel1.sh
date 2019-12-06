#!/usr/bin/env sh

cat input | awk ' \
BEGIN{sum=0} \
{sum = sum + int($1 / 3) - 2} \
END{print sum} \
'

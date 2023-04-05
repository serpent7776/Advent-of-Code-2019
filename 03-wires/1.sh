#!/bin/sh

sed -E -e '1s/(\w)(\d*)/\1 x \2/g' -e '1a--' -e '2s/(\w)(\d*)/\1 o \2/g' input | sed 's/,/\n/g' | awk -f 1.awk | sort -k 3 | head -1 | cut -f3 -d ' '

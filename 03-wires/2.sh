#!/bin/sh

sed -E -e '1s/(\w)(\d*)/\1 x \2/g' -e '1a--' -e '2s/(\w)(\d*)/\1 o \2/g' ${1:-input} | sed 's/,/\n/g' | awk -f 2.awk | sort -nk 5 | head -1 | cut -f5 -d ' '

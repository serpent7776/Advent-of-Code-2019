#!/bin/sh
awk -f initmem.awk -f intcode.awk -f ord.awk -f run.awk | tail -1 | perl -C -ln -e 'print ord'

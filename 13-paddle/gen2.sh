#!/usr/bin/env sh
rm -f fd
mkfifo fd

awk -f initmem.awk -f play.awk -f intcode.awk < fd | awk -f paste3.awk | awk -f filter.awk | awk -f paddle.awk | tee fd | tail -1

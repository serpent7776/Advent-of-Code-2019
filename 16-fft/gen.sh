#!/bin/sh
awk -f fft.awk < ${1:-input}

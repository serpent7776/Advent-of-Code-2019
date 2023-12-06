#!/bin/sh
tr -d ',=>' < ${1:-input} | awk -f resources.awk

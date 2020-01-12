#!/bin/sh
tr , \\n < input | awk -f intcode2.awk

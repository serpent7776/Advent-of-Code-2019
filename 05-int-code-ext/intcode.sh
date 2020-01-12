#!/bin/sh
tr , \\n < input | awk -f intcode.awk

#!/usr/bin/env sh
awk -f intcode.awk | paste - - - | awk '{if ($3 == 2) {i++}} END{print(i);}'

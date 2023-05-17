# AoC #7

## Part 1

Execute `./gen.sh | sort -n | tail -1`.

This expects a file called `input` to contain your puzzle input.

## Part 2

Execute `./gen2.sh`

This expects a file called `input` to contain your puzzle input.

This [ab]uses filesystem fifos to communicate multiple `awk` interpreters. It's somewhat unstable and sometimes hangs and doesn't produce output. Just restart it in that case.

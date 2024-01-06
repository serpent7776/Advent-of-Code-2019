# AoC #19

## Solution in awk

### Part 1

Run `./gen.sh`.

This expects a file called `input` to contain your puzzle input.

This will draw tractor beam and count how many points are affected.

### Part 2

Run `./gen2.sh`.

This expects a file called `input` to contain your puzzle input.

First, it will search the tractor beam for a 100 column.
Then, having the bottom-left point, check if top-right point in within tractor beam as well.
If it is, we're done.

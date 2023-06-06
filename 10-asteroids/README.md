# AoC #10

## Solution in awk

### Part 1

Execute `./gen.sh`.

This expects a file called `input` to contain your puzzle input.

This basically reads whole map into awk array and then computes number of visible asteroids for each asteroid.

### Part 2

Execute `./gen2.sh`.

This expects a file called `input` to contain your puzzle input.

This is split into two separate scripts. The first one computes angle and distance from base for each asteroid.
It is then sorted by distance and then by angle and becomes input for the second script.
This script goes through the input in order and treats each line as next destroyed asteroid, unless its angle is the same as previous ones. In that case it's put on the side and processing continues. After all input lines are processed, the script processes the entries that were put aside and processes them the same way. This is repeat as long as there's entries on the side.

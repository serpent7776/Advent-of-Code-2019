# AoC #13

## Solution in awk

### Part 1

Run `./gen.sh`.

This expects a file called `input` to contain your puzzle input.

### Part 2

Run `./gen2.sh`

This expects a file called `input` to contain your puzzle input.

This basically implements awk script that play the paddle game.
If the paddle is to the left of the ball, it's moved to the right.
If the paddle is to the right of the ball, it's moved to the left.
Otherwise the paddle is not moved.

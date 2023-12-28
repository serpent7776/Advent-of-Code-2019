# AoC #17

## Solution in awk

### Part 1

Run `./gen.sh`. First, the initial map will be drawn. Then, the result will be printed.

This expects a file called `input` to contain your puzzle input.

This first remembers all the tiles and then searches for all scaffolding tiles that are adjacent to four other scaffolding tiles.

### Part 2

Run `./gen2.sh`.

This expects a file called `input` to contain your puzzle input.

This is a hard-coded solution to my puzzle input. Won't work with any other.

The solution is printed as a single Unicode character. Awk cannot handle that, so perl is used to transform that to an integer.

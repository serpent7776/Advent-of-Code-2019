# AoC #15

## Solution in awk

### Part 1

Run `./gen.sh`. When enough map is drawn on the screen press Ctrl-C. The result should be printed below after that.

This expects a file called `input` to contain your puzzle input.

This basically required path searching algorithm. I went with simple bfs, because anything more fancy would be much harder to implement in awk as it doesn't have priority queues.

This time I modified int code evaluator so that the input and output operations are realised by higher order functions. This is gawk extension, but greatly simplifies the implementation.

### Part 2

Run `./gen2.sh`. This will also draw map while running, but you'll need to wait for the whole map to be drawn to get the proper answer.

This expects a file called `input` to contain your puzzle input.

The solution from part 1 pretty much solves this already. Just a few modifications were necessary.

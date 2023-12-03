# AoC #12

## Solution in awk

### Part 1

Execute `./gen.sh`.

This expects a file called `input` to contain your puzzle input.

`sim.awk` does a single step of simulation.
To do 1000 steps I just piped the input data through 1000 invocations of `sim.awk`.
I was actually quite surprised this does not exceeds a command line limit and works just fine.

### Part 2

Execute `./gen2.sh`.

This expects a file called `input` to contain your puzzle input.

In this case doing brute force takes way too long.
Instead, compute the step count separately in x, y and z axes.
Then compute LCM of these, also in awk.

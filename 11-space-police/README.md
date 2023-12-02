# AoC #11

## Solution in awk

### Part 1

Execute `./gen.sh`.

This expects a file called `input` to contain your puzzle input.

This is based on `intcode.awk` from previous days. It chains it with another awk script that does post processing `paint.awk`. The second script need two lines from the previous script for its state to advance. That's why there's a `xargs` call in the middle that joins the lines.
I used `paste - -` for that previously, but there's some issues with buffering that makes it stuck for some reason.

### Part 2

Execute `./gen2.sh`.

This expects a file called `input` to contain your puzzle input.

Just an extension to the first day.
Uses ANSI codes to draw solution in your terminal.
Instead of `xargs`, which had some issues as well, use `sed`, which works flawlessly here.

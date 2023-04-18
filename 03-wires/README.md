# Solution in awk.

## Part 1

First pre-process input file from wire per line to an extend per line to make it easier to work with in awk, e.g.:

```
R8,U5,L5,D3
U7,R6,D4,L4
```

becomes

```
R x 8
U x 5
L x 5
D x 3
--
U o 7
R o 6
D o 4
L o 4
```

`x` signifies the first wire, `o` the second one.
`--` is separator between the first and second wire. It is used to reset script data.

Then awk script records coordinates (x, y) of each visited tiles for both the first wire and the second one.
When adding coordinates for the second one, a check is made whether this position was already visited by the first wire. If so the script prints (x, y) coordinates and Manhattan distance.
This output is then sorted by distance and the first one becomes the result.

## Part 2

This extends the part 1. In addition to coordinates, a distance in tiles from the start is being stored.
This also uses two separate data structures to store the data, one for each wire.
It works just like in part 1. For the first wire it just stores the data.
The second wire works the same way, but additionally check if the first wire already visited that tile. If so it prints coordinates, wire lengths and their sum. Then the result is being sorted and the first row is the final answer.

# AoC #9

## Solution in awk

This is based on #AoC day 5.

One change is that now opcodes in `input` file are not read from `stdin`, but are transformed using `./intcode.vim` script and embedded inside awk script.

Open your `input` file, source `intcode.vim` and paste result in `BEGIN` section in `intcode-sensors.awk` file and then run `awk intcode-sensors.vim`.

This time opcode `3` was properly implemented to actually read value from `stdin`.

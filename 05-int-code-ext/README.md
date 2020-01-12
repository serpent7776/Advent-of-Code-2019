# AoC #5

## Solution in awk

This is based on #AoC day 2.

Just run `./intcode.sh` or `./intcode2.sh` in your terminal. This expects `input` file to exist in your current directory. This time it uses `tr` instead of `sed` as this is more portable.

This is simple extension of the previous intcode solution. One note on the new input operation - opcode 3. This is supposed to read a value from `stdin`, but since there was only one input I hardcoded this to always write value `1` to target register. This way it was easier to implement and also YAGNI.

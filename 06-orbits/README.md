# AoC #6

## Solution in pure vim macros

### Part 1

- open your `input` file in vim
- `:source orbits.vim`
- press `@x`, new split should open
- spam `@q` like gazillion times until `input` buffer gets empty
- press `@t` and result should be copied to your clipboard. In case clipboard is not available, the result is also stored in `s` register

### Part 2

- open your `input` file in vim
- `:source orbits.vim`

- press `@y`
- keep pressing `@d` until vim says cannot find matching pattern - this can be automated with something like `300@d`
- open new buffer (let's call it buffer `Y`) and paste contents of `a` register with `"ap"` and delete any empty line at top of the buffer

- press `@u`
- keep pressing `@d` until vim says cannot find matching pattern - this can be automated with something like `300@d`
- open new buffer (let's call it buffer `U`) and paste contents of `a` register with `"ap"` and delete any empty line at top of the buffer

- enable `diffthis` for buffers `Y` and `U`
- count number of lines that differ in buffer `Y`
- count number of lines that differ in buffer `U`
- add those two numbers together and subtract `2` - this will give you the answer to the task

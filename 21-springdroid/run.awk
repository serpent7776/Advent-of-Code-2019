#     @
# #####.###########
# !A
#
#   ! @
# #####.#.##..#####
# !A && B && !C && D
#
#     @
# #####...#########
# !A && !B && !C && D
#
#   @
# #####.#..########
# A && B && !C && D && H
#
#    @
# #####..#.########
# A && !B && !C && D
#
#       @
# #####.##.##...###
# A && !B && C && D

# https://www.wolframalpha.com/input?i=%5B%2F%2Fmath%3A%21A+%7C%7C+%28%21A+%26%26+B+%26%26+%21C+%26%26+D%29+%7C%7C+%28A+%26%26+B+%26%26+%21C+%26%26+D+%26%26+H%29+%7C%7C+%28A+%26%26+%21B+%26%26+%21C+%26%26+D%29+%7C%7C+%28A+%26%26+%21B+%26%26+C+%26%26+D%29%2F%2F%5D
# Minimal form: 
# OR: ¬A ∨ ¬(B ∨ ¬D) ∨ ¬(C ∨ ¬D ∨ ¬H)

BEGIN {
	SUBSEP = ":"
	N = 1
	K = 1
	str[1] = \
		"NOT H J\n" \
		"NOT D T\n" \
		"OR T J\n" \
		"OR C J\n" \
		"NOT J J\n" \
		"" \
		"NOT D T\n" \
		"OR B T\n" \
		"NOT T T\n" \
		"OR T J\n" \
		"" \
		"NOT A T\n" \
		"OR T J\n" \
		"RUN\n"
	exec("input", "output")
}

function input() {
	return ord(substr(str[N], K++, 1))
}

function output(c) {
	printf("%c", c)
}

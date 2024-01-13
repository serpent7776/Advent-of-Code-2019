#  !  @
# #####.###########
# !A
#
#   @
# ###...###
# !A & !B & !C & D
#
#  !@!!
# #####.#..########
# !C & A & B & D
#
#    @
# #####..#.########
# !B & !C & A & D

# https://simplogic.dev/
# Simplified Expression: !A || !C && D

BEGIN {
	SUBSEP = ":"
	N = 1
	K = 1
	str[1] = \
		"NOT C J\n" \
		"AND D J\n" \
		"NOT A T\n" \
		"OR T J\n" \
		"WALK\n"
	exec("input", "output")
}

function input() {
	return ord(substr(str[N], K++, 1))
}

function output(c) {
	printf("%c", c)
}

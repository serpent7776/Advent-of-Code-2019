BEGIN {
	SUBSEP=":"
	printf("\033[2J\033[1;1H") # clear entire screen and goto (1,1)
	xy = 0 # even to input x, odd to input y
	beam()
	printf("\033[52;1H%d\n", total) # goto (x,y)
}

function input() {
	return (xy++ % 2) == 0 ? x : y
}

function output(c) {
	printf("\033["(y+1)";"(x+1)"H%c", (c == 1 ? "#" : ".")) # goto (x,y)
	last = c
}

function test() {
	clear_mem()
	exec("input", "output")
	return last
}

function beam() {
	for (x = 0; x < 50; ++x)
		for (y = 0; y < 50; ++y)
			total += test()
}

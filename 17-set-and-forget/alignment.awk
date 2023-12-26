BEGIN {
	SUBSEP=":"
	x = 1
	y = 1
	exec("input", "output")
	intersections()
}

function input() {
	return 0
}

function output(c) {
	printf("%c", c)
	map[x,y] = sprintf("%c", c)
	x++
	if (c == 10) {
		y++
		x = 1
	}
	W = max(W, x)
	H = max(H, y)
}

function max(a, b) {
	return a > b ? a : b;
}

function intersections(    i, xi, yi) {
	W--
	H-=2
	# print(W, H)
	for (yi=0; yi<=H; ++yi)
		for (xi=0; xi<=W; ++xi) {
			if (xi == 1 || yi == 1) continue
			if (xi == W || yi == H) continue
			if (map[xi,yi] == "#" &&
				map[xi+1,yi] == "#" &&
				map[xi-1,yi] == "#" &&
				map[xi,yi+1] == "#" &&
				map[xi,yi-1] == "#") {
				alignment += (xi-1)*(yi-1)
			}
		}
	print(alignment)
}

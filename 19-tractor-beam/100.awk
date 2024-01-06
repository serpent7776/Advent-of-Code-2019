BEGIN {
	SUBSEP=":"
	xy = 0 # even to input x, odd to input y
	find100()
}

function input() {
	return (xy++ % 2) == 0 ? TX : TY
}

function output(c) {
	last = c
}

function test(tx, ty) {
	TX=tx
	TY=ty
	clear_mem()
	prev = last
	exec("input", "output")
	return last
}

function coalesce(a, b) {
	if (a != 0) return a
	return b
}

function edgeup() {
	return last == 1 && prev == 0
}

function edgedown() {
	return last == 0 && prev == 1
}

function find100() {
	for (x = 10;; ++x)
	{
		height = 0
		prev = 0
		last = 0
		for (y = y0;; ++y)
		{
			height += test(x, y)
			if (edgeup()) y0 = y
			if (edgedown()) break
		}
		if (height >= 100) {
			y-- # current y is at ".", move it back to "#"
			# we're at the bottom-left point of the square
			# check if top-right point is within the tractor beam
			test(x + 99, y - 99)
			# if it is, we're done
			if (last == 1) break
		}
	}
	print(x*10000 + (y-99)) # y-99, because we want top-left point
}

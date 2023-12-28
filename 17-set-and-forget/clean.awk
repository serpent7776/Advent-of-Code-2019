BEGIN {
	SUBSEP=":"
	x = 1
	y = 1
	MOV = "A,B,A,C,A,B,C,B,C,B"
	A = "L,10,R,8,L,6,R,6"
	B = "L,8,L,8,R,8"
	C = "R,8,L,6,L,10,L,10"
	video_feed = "n"
	N = 1
	K = 1
	str[1] = MOV
	str[2] = A
	str[3] = B
	str[4] = C
	str[5] = video_feed
	mem[0] = 2
	exec("input", "output")
}

function input() {
	if (length(str[N]) < K) {
		N++
		K = 1
		return ord("\n")
	}
	else return ord(substr(str[N], K++, 1))
}

function output(c) {
	printf("%c", c)
	map[x,y] = chr(c)
	x++
	if (c == 10) {
		y++
		x = 1
	}
}

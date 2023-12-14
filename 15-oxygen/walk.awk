BEGIN {
	SUBSEP=":"
	printf("\033[2J\033[1;1H") # clear entire screen and goto (1,1)
	N=1; E=4; S=2; W=3;
	WALL=0; STEP=1; OXYGEN=2;
	dir = N
	sx = 60
	sy = 30
	srand()
	map(sx, sy, "@")
	exec("input", "output")
}

function map(x, y, c) {
	if (!data[x, y]) {
		data[x, y] = c
		print(x, y, c) > "map"
		fflush()
	}
}

function input() {
	dir = int(rand()*4+1)
	return dir
}

function output(step,    dx, dy) {
	if (step == WALL) {
		if (dir == N) {
			dy = 1;
		} else if (dir == E) {
			dx = 1;
		} else if (dir == S) {
			dy = -1;
		} else if (dir == W) {
			dx = -1;
		} else {
			print("Invalid direction ", dir) > "/dev/stderr";
			exit;
		}
		map(sx+dx, sy+dy, "#")
		printf("\033["(sy+dy)";"(sx+dx)"H#") # goto (x,y)
	} else if (step == STEP || step == OXYGEN) {
		if (dir == N) {
			sy++;
		} else if (dir == E) {
			sx++;
		} else if (dir == S) {
			sy--;
		} else if (dir == W) {
			sx--;
		} else {
			print("Invalid direction ", dir) > "/dev/stderr";
			exit;
		}
		map(sx, sy, (step == OXYGEN ? "X" : "."))
		printf("\033["sy";"sx"H"(step == OXYGEN ? "X" : ".")) # goto (x,y)
	} else {
		print("invalid val: ", step) > "/dev/stderr";
	}
}

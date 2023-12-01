BEGIN {
	N=0; E=1; S=2; W=3;
	dir=N;
	x=0;
	y=0;
	SUBSEP=":";
	panels[x, y] = 0;
	print(panels[x, y]);
	fflush();
}

{
	color=$1;
	rot=int($2) * 2 - 1; # transform 0|1 into -1|1
	panels[x, y] = color;
	dir = (dir + rot + 4) % 4; # +4 to make it always positive
	if (dir == N) {
		y++;
	} else if (dir == E) {
		x++;
	} else if (dir == S) {
		y--;
	} else if (dir == W) {
		x--;
	} else {
		print("Invalid direction ", dir) > "/dev/stderr";
		exit;
	}
	cur = panels[x, y];
	print(cur == "" ? 0 : cur);
	fflush();
}

END {
	print(length(panels)) > "/dev/stderr";
}

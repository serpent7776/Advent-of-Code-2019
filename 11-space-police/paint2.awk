BEGIN {
	N=0; E=1; S=2; W=3;
	dir=N;
	x=0;
	y=0;
	SUBSEP=":";
	panels[x, y] = 1;
	print(panels[x, y]);
	fflush();
}

{
	color=int($1);
	rot=int($2) * 2 - 1; # transform 0|1 into -1|1
	# paint current panel
	panels[x, y] = color;
	dir = (dir + rot + 4) % 4; # +4 to make it always positive
	# rotate 90deg or -90deg
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
		exit 1;
	}
	# read current panel
	cur = panels[x, y];
	cur = cur == "" ? 0 : cur;
	print(cur);
	fflush();
}

END {
	for (i in panels)
	{
		split(i, a, SUBSEP);
		cur = panels[i];
		cur = cur == "" ? 0 : cur;
		print(a[1], 10-a[2], cur == 1 ? "#" : ".") > "/dev/stderr";
	}
	fflush();
}

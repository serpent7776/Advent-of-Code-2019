BEGIN {
	x=0;
	y=0;
	sx = 0;
	so = 0;
}

function inc(c) {
	if (c == "R") { x++; }
	else if (c == "L") { x--; }
	else if (c == "U") { y++; }
	else if (c == "D") { y--; }
	else exit 1;
}

# first wire

/\w x \d+/ {
	for (i = 1; i <= $3; ++i) {
		inc($1);
		sx++;
		if (!a[x, y]) {
			a[x, y] = sx;
		}
	}
}

# reset

/--/ {
	x = 0;
	y = 0;
}

# second wire

/\w o \d+/ {
	for (i = 1; i <= $3; ++i) {
		inc($1);
		so++;
		if (!b[x, y]) {
			b[x, y] = so;
		}
		if (a[x, y]) {
			print x, y, a[x, y], b[x, y], a[x, y] + b[x, y];
		}
	}
}
